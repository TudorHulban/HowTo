# Linux Containers Debian LXC support

## Set SELinux to Permissive Mode

```sh
sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
```

Reboot.  
Check:

```sh
getenforce
```

## Install dependencies

### OS Level

```sh
sudo dnf install tar -y
sudo dnf install iptables -y
```

### EPEL Repository

```sh
sudo dnf install epel-release -y
```

### Bridge utils

```sh
sudo dnf install bridge-utils -y
```

Create bridge:

```sh
sudo nmcli con add type bridge ifname lxcbr0
sudo nmcli connection add type bridge-slave ifname ens18 master lxcbr0
sudo nmcli connection modify bridge-lxcbr0 ipv4.method auto # or static for fixed IP
sudo nmcli connection up bridge-lxcbr0
```

Activate:

```sh
sudo nmcli con up bridge-lxcbr0
```

Verify:

```sh
sudo brctl show
```

## Install LXC

```sh
sudo dnf install lxc -y
```

## Configure LXC process

```sh
sudo vi /etc/default/lxc-net 

USE_LXC_BRIDGE="true"
LXC_BRIDGE = "lxcbr0"
```

Verify configuration:

```sh
lxc-checkconfig
```

Verify lxc network:

```sh
sudo systemctl status lxc-net
```

Troubleshoot and start:

```sh
sudo systemctl start lxc-net
```

## Create container

```sh
lxc-create --name mycontainer --template download -- --dist alpine --release 3.19 --arch amd64
```