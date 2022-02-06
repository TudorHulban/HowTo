# Installation of LXC on Debian
## Install container packages
```bash
sudo apt install lxc bridge-utils
```
## Create bridge interface
### Identify physical interface that will be used by the bridge
```bash
ip route 
# or
sudo vi /etc/network/interfaces
```
### Create the bridge in /etc/network/interfaces
```bash
# The primary network interface. Will be brought up by bridge
iface ens18 inet manual

# bridge
auto lxcbr0
iface lxcbr0 inet dhcp
    bridge_ports ens18
```
### Restart network service to load new configuration
```bash
sudo service networking restart
```

## Configure LXC process
```bash
sudo vi /etc/default/lxc-net 

USE_LXC_BRIDGE="true"
LXC_BRIDGE = "lxcbr0"
```

## Configure default container configuration
```bash
sudo vi /etc/lxc/default.conf

lxc.network.type = veth
lxc.network.link = lxcbr0
lxc.network.flags = up
lxc.network.hwaddr = 00:16:3e:xx:xx:xx
```

Container configuration in:
```bash
/var/lib/lxc/<container>/config
```

### Restart the LXC service
```bash
sudo service lxc-net restart
```

## Create container
```bash
sudo lxc-create -n <container name> -t debian -- -r stretch
```

### Attach as root to container
```bash
sudo lxc-start -n <container name>
sudo lxc-attach -n <container name>
```

### Occupied space by container
```bash
sudo du -sh /var/lib/lxc/<container name>
```

### Copy container 
Must be stopped to be copied:
```bash
sudo lxc-copy -n c001 -N c002
```

### Tests in container
```bash
apt install inetutils-ping
```
