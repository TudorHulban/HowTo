# DLNA
## Installation
```sh
sudo apt install minidlna
```
## Configuration
```sh
sudo vi /etc/minidlna.conf
```
Configuration for RAM disk:
```yaml
media_dir=V,/mnt/tmpfs.ramdisk
db_dir=/mnt/tmpfs.ramdisk
inotify=yes
wide_links=yes
```
## Start / Stop
```sh
sudo service minidlna stop
sudo service minidlna start
sudo service minidlna status
```
Enable after reboot
```sh
sudo systemctl enable minidlna
```
## Removal
```sh
sudo apt autoremove minidlna
```
