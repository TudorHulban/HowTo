# KVM - Alma Linux 9.4

## Prerequisites

### Host virtualization support

```sh
egrep -c '(vmx|svm)' /proc/cpuinfo  # result should be greater than zero
sudo kvm-ok   # check if system supports KVM virtualization
modinfo kvm | head
lscpu | grep -i virtualization # for AMD: AMD-V
zgrep CONFIG_KVM /boot/config-$(uname -r) # if kernel contains KVM modules

# install if needed with below
sudo apt install cpu-checker
```

### Host security

#### Set SELinux to Permissive Mode - might not be needed

```sh
sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
```

Reboot.  
Check:

```sh
getenforce
```

#### User rights

```sh
# add current user to the libvirtd group
sudo usermod -aG libvirt $USER
echo "export LIBVIRT_DEFAULT_URI='qemu:///system'" >> ~/.bashrc
source ~/.bashrc
# check connected instance
virsh uri # should be qemu:///system
```

### Host software dependencies

```sh
sudo dnf install qemu-kvm libvirt virt-install virt-viewer wget -y
# sudo dnf install libguestfs-tools -y
sudo systemctl enable --now libvirtd
```

Check:

```sh
lsmod | grep kvm
lscpu | grep Virtualization
sudo virt-host-validate qemu
sudo systemctl status libvirtd
```

### Host network dependencies

Check:

```sh
check bridge network
nmcli device
```

#### QEMU - add host bridge

Check curent network used by kvm:

```sh
sudo virsh net-list --all
# export
sudo virsh net-dumpxml default
```

Create bridge network:

```sh
sudo nmcli connection add type bridge con-name vmbr0 ifname vmbr0
sudo nmcli connection add type ethernet slave-type bridge con-name 'Bridge VM' ifname enp3s0 master vmbr0
# activate
sudo nmcli connection up vmbr0
# edit connection
sudo nmcli connection modify vmbr0 connection.autoconnect-slaves 1
# reactivate connection by rebooting or 
sudo nmcli connection up vmbr0
# verify
nmcli device status
```

Create KVM bridge configuration:

```sh
vi nwbridge.xml
# add
<network>
  <name>nwbridge</name>
  <forward mode='bridge'/>
  <bridge name='vmbr0'/>
</network>
# define nwbridge as a persistent virtual network
sudo virsh net-define nwbridge.xml
# activate the nwbridge and set it to autostart on boot
sudo virsh net-start nwbridge
sudo virsh net-autostart nwbridge
# verify
sudo virsh net-list --all
```

For any issues, to remove the created network bridge:

```sh
sudo virsh net-destroy nwbridge
sudo virsh net-undefine nwbridge

sudo nmcli connection up 'Wired connection 1'
sudo nmcli connection down vmbr0
sudo nmcli connection del vmbr0
sudo nmcli connection del 'Bridge connection 1'
```

```sh
# check if bridge file exists
ls -l /etc/qemu/bridge.conf
cat /etc/qemu/bridge.conf
# create if needed
sudo mkdir /etc/qemu
echo "allow lxcbr0" | sudo tee -a /etc/qemu/bridge.conf
# save to create file
sudo chmod 644 /etc/qemu/bridge.conf
# restart service
sudo systemctl restart libvirtd
```

## Tune system

```sh
sudo dnf install tuned
# start
sudo systemctl enable --now tuned
# set profile
sudo tuned-adm profile virtual-host
# check
tuned-adm active
sudo systemctl is-enabled tuned
```

See: https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html/monitoring_and_managing_system_status_and_performance/getting-started-with-tuned_monitoring-and-managing-system-status-and-performance#using-the-tuned-cpu-partitioning-profile-for-low-latency-tuning_getting-started-with-tuned.

### Desktop Client

The desktop client should be installed on the host used to launch the installation process.

```sh
sudo dnf install epel-release -y
sudo dnf install remmina -y
# check
remmina --version
```

## Create Virtual Machine

Download:

```sh
wget http://mirror.slitaz.org/iso/rolling/slitaz-rolling.iso
```

### CLI

Pre-create image:

Start the installation:

```sh
virt-install \
--name=slitaz-vm \
--vcpus=1 \
--memory=1024 \
--cdrom=/home/qemu/slitaz-rolling.iso \
--disk path=/mnt/tmpfs.ramdisk/vms/vm_slitaz.img,size=3 \
--os-variant=linux2022 \
--graphics vnc,listen=0.0.0.0,port=5900
```

### GUI

```sh
sudo virt-manager
```

## Post Installation

Enable `libvirt` service at boot:

```sh
sudo systemctl enable --now libvirtd
```

### Operations

```sh
# start
virsh start name-vm
# list
virsh list --all
# stop
virsh shutdown name-vm
virsh destroy name-vm
# remove
virsh managedsave-remove name-vm # if error: Refusing to undefine while domain managed save image exists
virsh undefine name-vm
# edit
virsh edit name-vm
# dump configuration
virsh dumpxml name-vm > name-vm.xml
# create from configuration
virsh create name.xml
```

### Manually create VM config file

Use:

```sh
--print-xml > slitaz-vm.xml
# define VM
virsh define slitaz-vm.xml
# start VM
virsh start slitaz-vm
```

### Manage with Cockpit

```sh
sudo dnf install cockpit cockpit-machines -y
# enable
sudo systemctl enable --now cockpit.socket
# check
sudo systemctl status cockpit.socket
# connect
https://ip-address:9090
```

## Troubleshoot

Desktop connection:

```sh
ss -tuln | grep 5900
```

### Check IP

```sh
virsh domifaddr name-vm
# mac
virsh domiflist alma-linux
```

### Cannot attach bridge

```sh
sudo cat /var/log/audit/audit.log | grep denied
```

Detach bridge from network manager:

```sh
sudo nmcli connection modify lxcbr0 connection.autoconnect no
sudo systemctl restart NetworkManager
```

### IPs not from LAN

```sh
virsh edit name-vm
# look for interface section, change to
<interface type='bridge'>
  <source bridge='lxcbr0'/>
  <model type='virtio'/>
</interface>
```

Restart the VM to applu changes:

```sh
virsh destroy name-vm
virsh start name-vm
```

## Alma Linux Example

```sh
# download and move to qemu home folder
wget https://almalinux.mirrors.orange.ro/9.4/live/x86_64/AlmaLinux-9.4-x86_64-Live-GNOME-Mini.iso
# start installation
virt-install \
--name=alma-linux \
--vcpus=4 \
--memory=8192 \
--cdrom=/home/qemu/AlmaLinux-9.4-x86_64-Live-GNOME-Mini.iso \
--disk path=/mnt/tmpfs.ramdisk/vms/vm_alma.img,size=18 \
--os-variant=linux2022 \
--graphics vnc,listen=0.0.0.0,port=5900
```

## Generic example

```sh
virt-install \
--name=linux \
--vcpus=4 \
--memory=8192 \
--cdrom=/home/qemu/sparkylinux-7.5-x86_64-minimalgui.iso \
--disk path=/mnt/tmpfs.ramdisk/vms/vm_linux.img,size=18 \
--os-variant=linux2022 \
--graphics vnc,listen=0.0.0.0,port=5900
```

## Resources

```html
https://www.youtube.com/watch?v=LHJhFW7_8EI
https://sysguides.com/kvm-guest-os-from-the-command-line
https://linux.how2shout.com/how-to-install-kvm-on-almalinux-9-or-rocky-linux-9-to-create-vms/
https://www.liquidweb.com/help-docs/install-kvm-on-linux-almalinux/
https://www.tecmint.com/install-kvm-on-ubuntu/
https://linuxconfig.org/how-to-create-and-manage-kvm-virtual-machines-from-cli
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_installation_overview-creating_guests_with_virt_install
https://www.golinuxcloud.com/virt-install-examples-kvm-virt-commands-linux/
```
