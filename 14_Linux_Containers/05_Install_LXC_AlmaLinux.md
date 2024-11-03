# Linux Containers Alma Linux LXC support

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
sudo dnf install tar iptables dnsmasq -y
```

### EPEL Repository

```sh
sudo dnf install epel-release -y
```

### Bridge utils

```sh
sudo dnf install bridge-utils -y
```

Check physical network name to update below commands:

```sh
nmcli device  # got enp3s0
```

Create bridge:

```sh
sudo nmcli con add ifname br0 type bridge con-name br0
sudo nmcli connection add type bridge-slave ifname enp3s0 master br0
sudo nmcli connection modify br0 ipv4.method auto # or static for fixed IP
sudo nmcli connection up br0 # activate
```

Reboot.  

For troubleshooting:

```sh
sudo nmcli con del br0
```

Verify:

```sh
nmcli device # should show bridge connected.

nmcli con show
sudo brctl show
```

## Install LXC

```sh
sudo dnf install lxc -y
```

## Configure LXC process

### LXC network

```sh
sudo vi /etc/default/lxc-net 

USE_LXC_BRIDGE="true"
LXC_BRIDGE = "br0"
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
journalctl -xe -u lxc-net.service
sudo systemctl restart lxc.service lxc-net.service
```

### Container configuration

### Global configuration

```sh
sudo vi /etc/lxc/default.conf
```

## Create container

### Local templates

```sh
ls /usr/share/lxc/templates/
```

### Download template

```sh
sudo dnf install lxc-templates -y
ls /usr/share/lxc/templates/
```

### Create

```sh
sudo lxc-create -t download -n container-template
sudo lxc-ls -f
sudo lxc-start container-template
sudo lxc-attach container-template
sudo lxc-copy -n container-template -N c1
sudo lxc-start c1
sudo lxc-info -n c1
sudo lxc-stop -n c1
```

### List

```sh
sudo lxc-ls --fancy --stopped
sudo lxc-ls --fancy --running
```

## Resources

```yaml
https://www.answertopia.com/rocky-linux/creating-a-rocky-linux-kvm-networked-bridge-interface/
https://www.claudiokuenzler.com/blog/1339/how-to-run-rocky-linux-9-lxc-container-fix-network-enable-epel-repositories
https://www.redhat.com/en/blog/exploring-containers-lxc
https://www.cyberciti.biz/faq/howto-forcefully-stop-and-kill-lxc-container-on-linux/
https://www.cyberciti.biz/faq/how-to-find-out-information-about-lxc-cpu-memory-networking/
```
