## Check if installed
```sh
whereis samba
```
## Add new folder to share
Edit configuration file:
```sh
vi /etc/samba/smb.conf
```
Add share in the end of the file:
```sh
[sambashare]
    comment = description of share
    path = /home/user/path
    read only = no
    browsable = yes
```
## Restart Samba service so the new configuration takes effect
```sh
sudo service smbd restart
```
## Resources
```
https://tecadmin.net/mounting-samba-share-on-ubuntu/
```
