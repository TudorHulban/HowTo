# KVM

## Prerequisites

### Host virtualization support

```sh
egrep -c '(vmx|svm)' /proc/cpuinfo  # result should be greater than zero
sudo kvm-ok   # check if system supports KVM virtualization

# install if needed with below
sudo apt install cpu-checker
```

### Host software dependencies

```sh
sudo dnf install qemu-kvm libvirt -y
sudo dnf install virt-install virt-viewer virt-top libguestfs-tools -y
sudo systemctl enable --now libvirtd
```

Check:

```sh
lsmod | grep kvm
lscpu | grep Virtualization
virt-host-validate
sudo systemctl status libvirtd
```

Add current user to the libvirtd group:

```sh
sudo adduser `user name` libvirtd
```

### Host network dependencies

Check:

```sh
check bridge network
nmcli device
```

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

```sh
qemu-img create -f qcow2 $HOME/ram/vms/vm_slitaz_1.img 3G
```

Start the installation:

```sh
virt-install \
--name=slitaz-vm \
--vcpus=1 \
--memory=1024 \
--cdrom=$HOME/ram/slitaz-rolling.iso \
--disk path=$HOME/ram/vms/vm_slitaz_1.img \
--os-variant=generic \
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
undefine name-vm
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

## Alma Linux Example

```sh
# download
wget https://almalinux.mirrors.orange.ro/9.4/live/x86_64/AlmaLinux-9.4-x86_64-Live-GNOME-Mini.iso
# pre-create
qemu-img create -f qcow2 $HOME/ram/vms/vm_alma.img 20G
# start installation
virt-install \
--name=alma-linux \
--vcpus=4 \
--memory=8192 \
--cdrom=$HOME/diskx/AlmaLinux-9.4-x86_64-Live-GNOME-Mini.iso \
--disk path=$HOME/ram/vms/vm_alma.img \
--os-variant=generic \
--graphics vnc,listen=0.0.0.0,port=5900
```

## Resources

```html
https://linux.how2shout.com/how-to-install-kvm-on-almalinux-9-or-rocky-linux-9-to-create-vms/
https://www.liquidweb.com/help-docs/install-kvm-on-linux-almalinux/
https://www.tecmint.com/install-kvm-on-ubuntu/
https://linuxconfig.org/how-to-create-and-manage-kvm-virtual-machines-from-cli
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_installation_overview-creating_guests_with_virt_install
https://www.golinuxcloud.com/virt-install-examples-kvm-virt-commands-linux/
http://mirror.slitaz.org/iso/rolling/slitaz-rolling.iso
```
