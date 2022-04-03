## Install Samba
```sh
sudo apt-get install samba
# check
sudo service smbd status
```
## Add new folder to share
Edit configuration file:
```sh
vi /etc/samba/smb.conf
```
Add share in the end of the file:
```sh
[sharename]
    comment = description of share
    path = /home/user/path
    read only = no
    browsable = yes
```
## Restart Samba service so the new configuration takes effect
```sh
sudo service smbd restart
```
## Add Samba user
```sh
sudo smbpasswd -a username
```
## Resources
```
https://tecadmin.net/mounting-samba-share-on-ubuntu/
```
