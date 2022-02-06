# GOGS: Installation Steps
## Install git
```bash
sudo apt-get update
sudo apt install git
```
## Download Gogs
```bash
wget https://gogs.io/docs/installation/install_from_binary
```
## Install Gogs
### Untar
```bash
tar -xvf <archive>
```
### Run
```bash
cd gogs
./gogs web
```
Connect:
http://localhost:3000/install
## Configure
### Create RDBMS for persistance.
Add IP for Gogs server in pg_hba.conf in /etc/postgresl/9.6/main.
### Sync server to one NTP.
