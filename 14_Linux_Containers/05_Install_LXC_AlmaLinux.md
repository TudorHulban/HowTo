# Linux Containers Debian LXC support

## Set SELinux to Permissive Mode

```sh
sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
```

Check:

```sh
getenforce
```

## Install dependencies

### OS Level

```sh
sudo dnf install tar
sudo dnf install iptables
```

### EPEL Repository

```sh
sudo dnf install epel-release
```

### Bridge utils

```sh
sudo dnf install bridge-utils -y
```

Create bridge:

```sh
sudo nmcli con add type bridge ifname lxcbr0
sudo nmcli connection add type bridge-slave ifname enp3s0 master lxcbr0
sudo nmcli connection modify bridge-lxcbr0 ipv4.method auto # or static for fixed IP
sudo nmcli connection up bridge-lxcbr0
```

Activate:

```sh
nmcli con up bridge-lxcbr0
```

Verify:

```sh
sudo brctl show
```

## Install LXC

```sh
sudo dnf install lxc
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