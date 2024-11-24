# Proxmox: Debian Installation

## Install Debian

## Install Proxmox

### Configure network

As root in  /etc/hosts:

```sh
# 127.0.1.1     <hostname>
192.168.1.35    <hostname> pvelocalhost
```

### Install Proxmox 5.x

Requires Debian 9.x.
```html

https://pve.proxmox.com/wiki/Install_Proxmox_VE_on_Debian_Stretch
```

As root:

```sh
echo "deb http://download.proxmox.com/debian/pve stretch pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
wget http://download.proxmox.com/debian/proxmox-ve-release-5.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-5.x.gpg
chmod +r /etc/apt/trusted.gpg.d/proxmox-ve-release-5.x.gpg
apt update # && apt dist-upgrade, might upgrade OS
apt install proxmox-ve postfix open-iscsi # skip postfix, open-iscsi if not needed
apt remove os-prober
# optional
apt remove linux-image-amd64 linux-image-4.9.0-3-amd64
```

Reboot:

```sh
init 6
```

Connect:

```html
https://192.168.1.35:8006/#v1:0:=node%2Fq190:4:=jsconsole:::::
```

### Upgrade Proxmox from 5 to 6

```html
https://pve.proxmox.com/wiki/Upgrade_from_5.x_to_6.0
```

### Create bridge for containers

#### Create bridge in Proxmox in node / Network / Create / Use Router IP as Gateway

#### Update bridge

```sh
cat /etc/network/interfaces
iface enp4s0 inet manual  # physical interface, will be brought up by bridge
auto vmbr0              # bridge
iface vmbr0 inet dhcp   # use DHCP
	gateway  192.168.1.0  # LAN Router / Gateway
	bridge-ports enp4s0   # physical interface that the bridge would use
	bridge-stp off
	bridge-fd 0
```
