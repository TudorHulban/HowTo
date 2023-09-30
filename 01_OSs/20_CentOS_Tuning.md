# CentOS Tuning

## Static IP
```sh
cd /etc/sysconfig/network-scripts
ls
ip addr
```
If netwrok interface is called 'ens18' for example, rename the existing file:
```sh
mv ifcfg-eth0 ifcfg-ens18
```
Update the file as below:
```yaml
[root@localhost network-scripts]# cat ifcfg-ens18 
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no

BOOTPROTO=static
IPADDR=192.168.1.137
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
DNS1=1.1.1.1
DNS2=8.8.8.8


DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=eth0
UUID=39da15fa-1921-4b87-98b1-d46ec16ee0ee
DEVICE=ens18

ONBOOT=yes
```
