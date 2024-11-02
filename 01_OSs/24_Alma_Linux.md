# Alma Linux 9.4

## Switch to static IP

```yaml
nmcli device
# configure in below the device from above.
# ex. enp3s0
sudo nmcli connection modify enp3s0 ipv4.addresses 192.168.1.88/24
sudo nmcli connection modify enp3s0 ipv4.gateway 192.168.1.1
sudo nmcli connection modify enp3s0 ipv4.dns 192.168.1.1
sudo nmcli connection modify enp3s0 ipv4.method manual
sudo nmcli connection down enp3s0; nmcli connection up enp3s0
sudo nmcli device show enp3s0
```

Reboot.

### Static IP switch resources

```html
https://www.server-world.info/en/note?os=AlmaLinux_9&p=initial_conf&f=3
```
