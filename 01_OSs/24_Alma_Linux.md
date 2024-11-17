# Alma Linux 9.4

## Change hostname

```sh
nmtui
```

## Switch to static IP

```yaml
nmcli device
# configure in below the device from above.
# ex. enp3s0
sudo nmcli connection modify enp3s0 ipv4.addresses 192.168.1.88/24
sudo nmcli connection modify enp3s0 ipv4.gateway 192.168.1.1
sudo nmcli connection modify enp3s0 ipv4.dns 100.100.1.1
sudo nmcli connection modify enp3s0 ipv4.dns 100.100.0.1
sudo nmcli connection modify enp3s0 ipv4.method manual
sudo nmcli connection down enp3s0; nmcli connection up enp3s0
sudo nmcli device show enp3s0
```

Reboot.  
Check:

```sh
cat /etc/resolv.conf
```

### Static IP switch resources

```html
https://www.server-world.info/en/note?os=AlmaLinux_9&p=initial_conf&f=3
```

## Disable services

List services:

```sh
systemctl list-units --type service | grep active
systemctl list-units --type service | grep running
```

```sh
sudo systemctl disable --now nis-domainname
sudo systemctl disable --now kdump
sudo systemctl disable --now firewalld
sudo systemctl disable --now ModemManager
sudo systemctl disable --now rsyslog # disable all logging !?
sudo systemctl disable --now cups # no printing
sudo systemctl disable avahi-daemon.socket avahi-daemon.service 
sudo systemctl mask avahi-daemon.socket avahi-daemon.service 
```

### Resources service disable

```html
https://reintech.io/blog/managing-services-with-systemd-almalinux-9
https://www.server-world.info/en/note?os=AlmaLinux_9&p=initial_conf&f=4
https://wiki.crowncloud.net/tools/how_to_configure_static_network_on_windows_server?How_to_Reclaim_RAM_from_the_System_Reserve_with_AlmaLinux_9
```
