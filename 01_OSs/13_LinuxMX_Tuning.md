# LinuxMX Tuning

## Add Romanian 

### Generate locales
### Add keyboard switch indicator to panel
### Add Romanian with win keys
Switch as needed.

## Switch system language to US
```sh
sudo update-locale LANG=en_US.UTF-8 UTF-8
```

## Set run level to text
```sh
sudo vi /etc/inittab
# modify line with default level as
id:3:initdefault:
```
Resources
```
https://ostechnix.com/check-runlevel-linux/
```
## Ebtables
```
https://wiki.debian.org/BridgeNetworkConnections
```
### Save Rules
```
ebtables-save -> /etc/network/ebtables.rules
```
## Update GRUB timeout
```sh
sudo vi /etc/default/grub
# change TIMEOUT value
sudo update-grub  # new configuration to be deployed
```
