### Installation (WIP)
#### Create container
#### As root:
```bash
apt install curl gnupg2 git-all
echo "deb https://download.gocd.org /" | tee /etc/apt/sources.list.d/gocd.list
curl https://download.gocd.org/GOCD-GPG-KEY.asc | apt-key add -
apt-get update
apt-get install go-server
systemctl start go-server
service go-server console
init 6
```
#### Connect in browser
```html
http://host:8153/go
```
#### Install gomatic
```bash
apt install python3-pip
pip3 install gomatic
```
