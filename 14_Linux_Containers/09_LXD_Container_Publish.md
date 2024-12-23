# Linux Containers - LXD Container Publish

## Publish container

```sh
lxc stop MyContainer
lxc publish MyContainer --alias=MyImage description="My base image (with ssh and key)"
```

## Use published container

```sh
lxc launch MyImage TestContainer
```

## List published (local) images

```sh
lxc image list
```

## Delete local image

```sh
lxc image delete <alias or fingerprint>
# get tarball from image. exported image in .:
lxc image export old-ubuntu .
```

## Ping from one container to another

```sh
lxc exec <fromContainerName> -- ping -c 4 <toContainerIP>
```

## Prepare image to use in LAN

### Ceate container based on LAN profile

```sh
lxc launch -p lanprofile lximages:ubuntu/bionic/amd64 c0610d
```

### Add SSH server and user different than root

### Add snapd

```sh
sudo apt install -y snapd
```

### Add this user to sudoers

### Push SSH key to this template

### Stop container and publish it

```sh
lxc publish c0610d --alias=LAN1804
```

### Create container based on this image and LAN profile

```sh
lxc launch -p lanprofile LAN1804 c0610e
```

## Resources

```html
https://wiki.gentoo.org/wiki/LXC#Virtualization_concepts
https://wiki.gentoo.org/wiki/LXD
https://linuxhint.com/ssh-port-forwarding-linux/
```
