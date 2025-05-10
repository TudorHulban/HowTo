# Alma Linux 9.4

## Change hostname

```sh
nmtui
```

## Switch to dynamic IP

```yaml
nmcli device # identify device
sudo nmcli connection modify enp3s0 ipv4.method auto
sudo nmcli connection down enp3s0; sudo nmcli connection up enp3s0 # restart connection to apply changes
nmcli device show enp3s0 # verify

# or
sudo nmcli con mod enp3s0 ipv4.method manual ipv4.address 192.168.1.200/24 ipv4.gateway 192.168.1.1 ipv4.dns "8.8.8.8 1.1.1.1"
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

## Enable services

```yaml
sudo dnf install openssh-server
sudo systemctl start sshd
sudo systemctl enable --now sshd
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

Tweaks:

```sh
grubby --update-kernel=ALL --args="skew_tick=1"
# reverse with
grubby --update-kernel=ALL --args="skew_tick=0"
# reboot for the change to take effect

sudo systemctl disable --now irqbalance
```

### Resources tweaks

```html
https://docs.redhat.com/en/documentation/red_hat_enterprise_linux_for_real_time/8/html-single/optimizing_rhel_8_for_real_time_for_low_latency_operation/index#proc_disabling-atime_minimizing-or-avoiding-system-slowdowns-due-to-journaling
```

## Document Scaner

```sh
sudo dnf install simple-scan
```

## Repair XFS drive

```sh
xfs_repair /dev/<sd device>
```

## Mount USB drive

```sh
sudo dnf install ntfs-3g
sudo mount -t ntfs-3g /dev/sdXN /mnt/external  # ex. /dev/sdb1
```
