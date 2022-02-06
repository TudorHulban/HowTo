# PROXMOX: Install and first steps
## 1. Get Proxmox ISO. Install (needs UEFI)
For multiple VMs, a network card is needed for each one starting with second VM.
```html
https://www.proxmox.com/en/downloads?task=callelement&format=raw&item_id=452&element=f85c494b-2b32-4109-b8c1-083cca2b7db6&method=download&args[0]=7b03f3ce48b75b7b5c4bbc322dfdb990
```
Connect to with browser:
```html
https://192.168.1.6:8006/#v1:0:18:4::::::
```
## 2. Get container images with
```bash
pveam available
pveam download  local debian-10.0-standard_10.0-1_amd64.tar.gz # download container
pveam download  local ubuntu-18.04-standard_18.04.1-1_amd64.tar.gz
pveam download  local ubuntu-20.04-standard_20.04-1_amd64.tar.gz
pveam download  local centos-8-default_20191016_amd64.tar.xz
pveam list local  # verify download
```
In case needed, to remove local image:
```bash
pveam remove local:vztmpl/alpine-3.7-default_20180913_amd64.tar.xz  
```
## 3. ISO images 
```bash
cd /var/lib/vz/template/iso  # see https://pve.proxmox.com/wiki/Storage:_Directory
```
## 4. Transfer image or connect by SSH and download image directly.
```bash
# on remote
sudo chmod 777 /var/lib/vz/template/iso
```
```bash
# on host with image
scp debian-9.8.0-amd64-xfce-CD-1.iso nonrootUser@192.168.1.100:/var/lib/vz/template/iso
```
Make sure to use ZFS and not SSD for created containers.
Add ZFS pool from Datacenter / Storage / Add.
## 5. Configure timezone
```bash
sudo dpkg-reconfigure tzdata
```
## 6. Move to no subscription repo
```bash
vi /etc/apt/sources.list.d/pve-enterprise.list # change to pve-no-subscription
# change line to
deb http://download.proxmox.com/debian/pve buster pve-no-subscription
```
### To upgrade
```
apt-get update
apt-get dist-upgrade
```
Resources:
```html
https://www.caretech.io/2018/06/08/how-to-update-proxmox-without-buying-a-subscription/
```
## 7. Connect to container, attach to container from Proxmox shell:
```bash
lxc-attach --name <container ID>
# or
pct enter <container ID>
```
## 8. Modify ssh configuration to allow root to connect or use SSH key
```bash
vi /etc/ssh/sshd_config
service ssh restart
```
## 9. For VMs use SPICE as video card for better connection from Linux host. <br />
For download use:
```html
https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.2.0-amd64-netinst.iso
```
## 10. Add new disk
```
lsblk
pvcreate /dev/sdnewdisk
vgcreate newgroup /dev/sdnewdisk
```
Add new LVM volume from Proxmox GUI, **Datacenter** -> Storage -> Add: LVM.

## 11. Regenerate Certificate
After IP address change regenerate self signed certificate:
```
pvecm updatecerts --force
```
### Resources
```
https://pve.proxmox.com/wiki/Network_Configuration
```
