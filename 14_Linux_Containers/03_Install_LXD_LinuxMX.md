# Linux Containers Linux MX LXD support

## Move to systemd

```sh
sudo apt install systemd-sysv
```

Remove the installed package to revert to sysV.  
Resources:

```sh
https://mxlinux.org/wiki/system/systemd/
```

## Switch to text mode

```sh
sudo systemctl set-default multi-user.target
sudo systemctl get-default  # verify mode
```

Note: If needed in order to revert.

```sh
systemctl set-default graphical.target
```

### Disable splash

```sh
sudo vi /etc/default/grub
# update line to
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
# generate new config
sudo update-grub
```

Reboot.  
Resources:

```sh
https://www.linuxuprising.com/2020/01/how-to-boot-to-console-text-mode-in.html
https://askubuntu.com/questions/766973/how-to-uninstall-plymouth
```

## Install snap

```sh
sudo apt install snapd
```

## Install snap core

```sh
snap install core
```

## Start snap service

```sh
sudo systemctl unmask snapd.service
sudo systemctl enable snapd.service
sudo systemctl start snapd.service
```

Resources:

```yaml
https://askubuntu.com/questions/1258137/cannot-communicate-with-server-post-http-localhost-v2-apps-dial-unix-run-sn
```

## Install lxd

As root:

```sh
snap install lxd
```

## Initialize lxd

### Automatically

```sh
sudo lxd init 
```

### Manually

#### Create network

#### Create storage volume

##### Create storage from separate disk

Wipe clean disk:

```sh
gdisk /dev/sdx
# use x to go in expert mode and wipe GPT and MBR
# create storage
lxc storage create  pool_name btrfs  source=/dev/sdx
```

##### Create storage from RAM disk

```sh
lxc storage create pool_name dir source=/ram/lxd
```

##### Check storage creation

```sh
lxc storage ls
```

##### Add storage to default profile

```sh
lxc profile device add default root disk path=/ pool=pool_name
```

Verify now the profile. The added pool should be added as root system in '/'.

```sh
lxc profile show default 
```

Resources

```yaml
https://www.youtube.com/watch?v=1p-fbS_OYTg
```

##### Update storage to default profile

```sh
lxc profile edit default # delete manually the root disk entries
lxc profile device add default root disk path=/ pool=pool_name  # adds new pool to the default profile
```

## Add container images

```sh
# add repo first
lxc remote add lximages images.linuxcontainers.org

lxc image list lximages: | grep focal | grep amd
```

## Create Container

Use below anytime image can be locally cached:

```sh
lxc launch lximages:ubuntu/focal/amd64 container_name
```

Using local image:

```sh
lxc image ls
lxc launch image_id container_name
```

## Resources

```yaml
https://forum.snapcraft.io/t/installing-snap-on-debian/6742
```
