## Set static IP
### Configure card
With admin rights in /etc/network/interfaces:
```
auto enp0s25
iface enp0s25 inet static
  address 192.168.1.7
  netmask 255.255.255.0
  broadcast 192.168.1.255
  gateway 192.168.1.1
```
### Restart network
```
 sudo /etc/init.d/networking restart
```

### dnsmasq
#### Install
```
apt-get update
apt-get install dnsmasq
```

Resources:
```
https://wiki.debian.org/dnsmasq
```

#### Run in debug mode first
```
dnsmasq --no-daemon --log-queries
```

#### Test configuration
```
dnsmasq --test
```
