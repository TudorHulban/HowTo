# Ubuntu: DHCP Server 
## Installation
```sh
sudo apt-get install isc-dhcp-server
```
Configure ethernet interface on which server will run:
```sh
sudo vim /etc/default/isc-dhcp-server
# add
INTERFACESv4="enp0s25"
```

## Configuration
Configure IP subnet and ranges:
```sh
sudo vim /etc/dhcp/dhcpd.conf
# add
subnet 192.168.1.0 netmask 255.255.255.0 {
range 192.168.1.100 192.168.1.110;
}
```

Restart daemon to load new configuration:
```sh
sudo service isc-dhcp-server restart
```

Verify server is up:
```sh
sudo netstat -uap
```
