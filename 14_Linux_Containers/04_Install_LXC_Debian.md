# Linux Containers Debian LXC support

## Install container packages

```sh
sudo apt install lxc bridge-utils
```

## Create bridge interface

### Identify physical interface that will be used by the bridge

```sh
ip route 
# or
sudo vi /etc/network/interfaces
```

### Create the bridge in /etc/network/interfaces

```sh
# The primary network interface. Will be brought up by bridge
iface ens18 inet manual

# bridge
auto lxcbr0
iface lxcbr0 inet dhcp
    bridge_ports ens18
```

### Restart network service to load new configuration

```sh
sudo service networking restart
```

## Configure LXC process

```sh
sudo vi /etc/default/lxc-net 

USE_LXC_BRIDGE="true"
LXC_BRIDGE = "lxcbr0"
```

## Configure default container configuration

```sh
sudo vi /etc/lxc/default.conf

lxc.network.type = veth
lxc.network.link = lxcbr0
lxc.network.flags = up
lxc.network.hwaddr = 00:16:3e:xx:xx:xx
```

Container configuration in:

```sh
/var/lib/lxc/<container>/config
```

### Restart the LXC service

```sh
sudo service lxc-net restart
```

## Create container

```sh
sudo lxc-create -n <container name> -t debian -- -r stretch
```

### Attach as root to container

```sh
sudo lxc-start -n <container name>
sudo lxc-attach -n <container name>
```

### Occupied space by container

```sh
sudo du -sh /var/lib/lxc/<container name>
```

### Copy container  

Container must be stopped to be copied:

```sh
sudo lxc-copy -n c001 -N c002
```

### Tests in container

```sh
apt install inetutils-ping
```

### Limit memory used

```sh
sudo lxc config set container-name limits.memory 256MB
```
