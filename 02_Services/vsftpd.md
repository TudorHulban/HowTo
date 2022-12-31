# VSFTPD: Installation and first steps
## Mac:
```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
brew install vsftpd
```
Runs as root on mac. so:
```bash
sudo chown root /usr/local/etc/vsftpd.conf
```
Launch as service:
```bash
sudo brew services start vsftpd
sudo brew services stop vsftpd
```
or just:
```bash
sudo vsftpd
```
remove:
```bash
brew remove vsftpd
```
## Linux:
```bash
sudo apt-get install vsftpd

sudo vi /etc/vsftpd.conf
#write_enable=YES
sudo service vsftpd restart
```
