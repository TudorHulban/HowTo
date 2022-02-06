# Virtual Box 6.1: Install on Buster 10.3 and first steps
## Headless Install
```bash
su -
apt install build-essential dkms unzip wget sudo gdebi
wget https://download.virtualbox.org/virtualbox/6.1.16/virtualbox-6.1_6.1.16-140961~Debian~buster_amd64.deb

# for Ubuntu
wget https://download.virtualbox.org/virtualbox/6.1.4/virtualbox-6.1_6.1.4-136177~Ubuntu~bionic_amd64.deb
apt install virtualbox-guest-utils virtualbox-guest-dkms
# if needed  sudo /sbin/vboxconfig

gdebi virtualbox-6.1_6.1.2-135662~Debian~buster_amd64.deb 
```
### Check service status
```bash
 systemctl status vboxdrv
 ```
## Headless Manage
Start headless
```
VBoxManage startvm --type headless "vm name"
```
Check state of VM
```
VBoxManage showvminfo "vm name" | grep "State"
```
Get IP
```
VBoxManage guestproperty get "vm name" "/VirtualBox/GuestInfo/Net/0/V4/IP"
```
List
```
# running VMs
vboxmanage list runningvms

# all VMs
VBoxManage list vms
```
Stop VM
```
VBoxManage controlvm "vm name" pause|resume|reset|poweroff|savestate
```
Delete VM
```
vboxmanage unregistervm "vm name" --delete
```
## Install Extension Pack
Extension Pack is needed for Remote Display.
```bash
wget https://download.virtualbox.org/virtualbox/6.1.2/Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack
```
Install.
 ```bash
VBoxManage extpack install <pack>
```
Install rdesktop on host used for management.
```bash
apt install rdesktop
# to connect: rdesktop -a 16 -N 192.168.1.x:3389
```
## Install phpvirtualbox
 ```bash
apt install apache2 php php-mysql libapache2-mod-php php-soap php-xml
 ```
Download
```bash
wget https://github.com/phpvirtualbox/phpvirtualbox/archive/develop.zip
```
Unzip
```bash
unzip 5.2-1.zip
```
Move to Apache folder
```bash
mv phpvirtualbox-5.2-1/ /var/www/html/phpvirtualbox
```
Copy configuration
```bash
cp /var/www/html/phpvirtualbox/config.php-example /var/www/html/phpvirtualbox/config.php
```
Set user owing VB process
```bash
vi /var/www/html/phpvirtualbox/config.php
# edit var $username = 'user';
# edit var $password = 'pass';
```
Create VB file
```bash
vi /etc/default/virtualbox
# add line with previously used user VBOXWEB_USER=user
```
Reboot.
## Connect
Login with admin/admin at ip/phpvirtualbox.

### SSH
Create in VM network settings a port forwarding with:<br/>
- protocol: TCP
- host IP: 127.0.0.1
- host port: 2222
- guest IP: 10.0.2.15 (VM IP)
- guest port: 22

Connect from host:
```bash
ssh -p 2222 USER@127.0.0.1
```
## Resources
```html
https://www.ostechnix.com/install-oracle-virtualbox-ubuntu-16-04-headless-server/
http://blog.johannesmp.com/2017/01/25/port-forwarding-ssh-from-virtualbox/
```
