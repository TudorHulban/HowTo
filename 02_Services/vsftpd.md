# VSFTPD: Installation and first steps

## Mac

```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
brew install vsftpd
```

Runs as root on mac. so:

```sh
sudo chown root /usr/local/etc/vsftpd.conf
```

Launch as service:

```sh
sudo brew services start vsftpd
sudo brew services stop vsftpd
```

or just:

```sh
sudo vsftpd
```

remove:

```sh
brew remove vsftpd
```

## Linux

```sh
sudo dnf install vsftpd

# backup original configuration
sudo mv /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf_orig
# create new configuration
sudo vi /etc/vsftpd/vsftpd.conf
# add
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
xferlog_std_format=YES
listen=NO
listen_ipv6=YES

pam_service_name=vsftpd
userlist_enable=YES
# restart
sudo service vsftpd restart
# check
sudo systemctl status vsftpd
```

### Allow root conection

Configuration only for insecure use:

```yaml
sudo vi /etc/pam.d/vsftpd
# modify sense option to allow
auth required pam_listfile.so item=user sense=allow file=/etc/vsftpd/ftpusers onerr=succeed

sudo vi /etc/vsftpd/vsftpd.conf
# comment or remove line if still not working after above
userlist_enable=YES
```
