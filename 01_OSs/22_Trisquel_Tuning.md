# Trisquel Tuning

## Remove SSH message MOTD
```sh
sudo vi /etc/pam.d/sshd

# comment below entries:
#session    optional     pam_motd.so  motd=/run/motd.dynamic
#session    optional     pam_motd.so noupdate
```

## Set static IP

### Configure card
With admin rights:

```sh
cd /etc/netplan/
sudo vi 00-installer-config.yaml 
# add below content:
# This file describes the network interfaces available on your system
# For more information, see netplan(5).
network:
  version: 2
  renderer: networkd
  ethernets:
    ens18:
      dhcp4: no
      dhcp6: no
      addresses: [192.168.1.77/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8,8.8.4.4]
```

apply newly added content:

```sh
# test first
sudo netplan --debug apply
sudo netplan apply
```

## dnsmasq
### Install

```sh
apt-get update
apt-get install dnsmasq
```

### Run in debug mode first
```
dnsmasq --no-daemon --log-queries
```

### Test configuration
```
dnsmasq --test
```

### Resources
```
https://wiki.debian.org/dnsmasq
```
