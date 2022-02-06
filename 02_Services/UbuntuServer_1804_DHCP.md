# Ubuntu: DHCP Server 
## Installation
```bash
sudo apt-get install isc-dhcp-server
```
Configure ethernet interface on which server will run:
```bash
sudo vim /etc/default/isc-dhcp-server
# add
INTERFACESv4="enp0s25"
```

## Configuration
Configure IP subnet and ranges:
```bash
sudo vim /etc/dhcp/dhcpd.conf
# add
subnet 192.168.1.0 netmask 255.255.255.0 {
range 192.168.1.100 192.168.1.110;
}
```

Restart daemon to load new configuration:
```bash
sudo service isc-dhcp-server restart
```

Verify server is up:
```bash
sudo netstat -uap
```
