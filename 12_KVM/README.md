# KVM 
## Prerequisites
```sh
egrep -c '(vmx|svm)' /proc/cpuinfo  # result should be greater than zero
sudo kvm-ok   # check if system supports KVM virtualization

# install if needed with below
sudo apt install cpu-checker
```
## Installation on XUbuntu
Package `virt-manager` needed also for starting `libvirt` service.
```sh
sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
```
Check if the virtualization daemon – libvritd-daemon – is running:
```sh
sudo systemctl status libvirtd
```
Add current user to the libvirtd group:
```
sudo adduser `user name` libvirtd
```
Check if the KVM modules are loaded:
```sh
lsmod | grep -i kvm
```
Enable `libvirt` service at boot:
```sh
sudo systemctl enable --now libvirtd
```
## Create Virtual Machine
### CLI
```sh
sudo virt-install --name=slitaz-vm \
--vcpus=1 \
--memory=1024 \
--cdrom=/home/tudi/ram/slitaz-rolling.iso \
--disk none \
--os-variant=generic
```
### GUI
```sh
sudo virt-manager
```

## Resources
```html
https://www.tecmint.com/install-kvm-on-ubuntu/
https://linuxconfig.org/how-to-create-and-manage-kvm-virtual-machines-from-cli
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_installation_overview-creating_guests_with_virt_install
https://www.golinuxcloud.com/virt-install-examples-kvm-virt-commands-linux/
http://mirror.slitaz.org/iso/rolling/slitaz-rolling.iso
```
