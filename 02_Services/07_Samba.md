# Samba

Please note that SMB1 is disabled at kernel level in most Linux latest versions.

## Install Samba

```sh
sudo apt-get install samba # server
sudo apt install smbclient # client
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

## Troubleshoot 

Check Samba port on server:

```yaml
nmap -p 445 <server-ip-address>
```

## Resources
```
https://tecadmin.net/mounting-samba-share-on-ubuntu/
```
