# VSFTPD: Installation and first steps
## Mac:
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
## Linux:
```sh
sudo apt-get install vsftpd

sudo vi /etc/vsftpd.conf
#write_enable=YES
sudo service vsftpd restart
```
