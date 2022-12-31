## Install Samba
```sh
sudo apt-get install samba
# check
sudo service smbd status
```
## Add new folder to share
Edit configuration file:
```sh
sudo vi /etc/samba/smb.conf
```
Add share in the end of the file:
```yaml
[sharename]
    comment = description of share
    path = /home/user/path
    read only = no
    browseable = yes
```
### Check shares
```sh
smbstatus --shares
```
## Restart Samba service so the new configuration takes effect
```sh
sudo service smbd restart
```
If it does not work, reboot.
## Add Samba user
Samba does not use the system account password.
```sh
sudo smbpasswd -a username
```
## Resources
```
https://tecadmin.net/mounting-samba-share-on-ubuntu/
```
