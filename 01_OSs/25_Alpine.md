# Alpine 3.2

## Install

Log in with `root` user and run `setup-alpine`.

## Linux support

Add community repo:

```sh
vi /etc/apk/repositories
# uncomment community line
```

```sh
sudo apk add lsof # ex. sudo lsof /mnt/media/
sudo apk add util-linux # ex. lsblk
sudo apk add exfatprogs # exFAT support
sudo apk add procps
```

### Vim

```sh
apk add vim
echo 'alias vi=vim' >> ~/.bashrc
```

### Sudo

```sh
apk add sudo
```

### Add bash

```sh
sudo apk add bash

# change to /bin/bash in
vi /etc/passwd
```

## Authorised keys

```sh
mkdir -p ~/.ssh
chmod 700 ~/.ssh

touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

## RAM disk

```sh
mkdir /mnt/ramdisk # Create a mount point

vi /etc/fstab
tmpfs   /mnt/ramdisk   tmpfs   defaults,size=1G   0   0
ln -s /mnt/tmpfs.ramdisk $HOME/ram  # can be removed later on with rm ram
```

## Mount exFAT USB drive

```sh
sudo sh -c 'echo fuse >> /etc/modules' # for future
modprobe fuse
mount /dev/sdXN /mnt/usb
sudo umount /dev/sdxN
```

## History size

```sh
vi ~/.profile
export HISTSIZE=100
export HISTFILESIZE=100
```

## Static IP

```sh
sudo vi /etc/network/interfaces

# replace dhcp with
auto eth0
iface eth0 inet static
    address 192.168.1.16/24
    gateway 192.168.1.1
    hostname alpine-linux
```

DNS:

```sh
sudo vi /etc/resolv.conf

nameserver 8.8.8.8
nameserver 1.1.1.1
```

Reboot.

