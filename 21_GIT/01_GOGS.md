# GOGS: Installation Steps

## Install git

```sh
sudo apt-get update
sudo apt install git
```

## Download Gogs

```sh
wget https://gogs.io/docs/installation/install_from_binary
```

## Install Gogs

### Untar

```sh
tar -xvf <archive>
```

### Run

```sh
cd gogs
./gogs web
```

Connect:
http://localhost:3000/install

## Configure

### Create RDBMS for persistance

Add IP for Gogs server in pg_hba.conf in /etc/postgresl/9.6/main.

### Sync server to one NTP
