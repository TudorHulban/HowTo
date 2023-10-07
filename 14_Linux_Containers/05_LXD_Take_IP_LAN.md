## Make containers take IP from LAN DHCP 
Does not work on wireless due to multiple MAC addresses which is not supported by access points.<br/>

Gather info:
```bash
lxc profile list
lxc profile show default
```
### Create LAN profile
```bash
lxc profile create lanprofile
```
Profile is empty. Would be used together with `default` profile for overriding the network settings.
### Get network interface name to use
```bash
ip link
```
### Set nictype as macvlan
```bash
lxc profile device set lanprofile eth0 nictype macvlan
```
### Set parent as interface connected to LAN
Identify parent:
```bash
ip route
```
Configure parent:
```bash
lxc profile device set lanprofile eth0 parent enp0s25
```
Check profile: 
```bash
lxc profile show lanprofile
```
### Set timezone
```bash
lxc profile set lanprofile environment.TZ Europe/Bucharest
```
### Create the new container
```bash
lxc launch container_name --profile default --profile lanprofile image_id
```
Check created container: 
```bash
lxc info container_name

### Resources
```
https://blog.simos.info/how-to-make-your-lxd-container-get-ip-addresses-from-your-lan/ <br/>
https://blog.simos.info/how-to-use-the-x2go-remote-desktop-with-lxd-containers/
