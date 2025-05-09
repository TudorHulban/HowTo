# Linux Containers Alpine Linux LXC support

## LXC install

```sh
apk add lxc
```

## Configure

### Add LXC templates

```sh
sudo apk add lxc-templates
sudo apk add lxc-download
ls /usr/share/lxc/templates
```

## Create container

```sh
sudo lxc-create -t download -n c1 -B zfs -- --dist alpine --release 3.20 --arch amd64
```

Check its creation:

```sh
sudo lxc-ls -f
sudo zfs list
```

## Optimize user commands

### Add user to LXC group and configure permissions

```sh
sudo addgroup lxc
sudo addgroup $(whoami) lxc
sudo chown -R :lxc /var/lib/lxc
sudo chmod -R g+rwX /var/lib/lxc

sudo chown -R :lxc /etc/lxc
sudo chmod -R g+rwX /etc/lxc
```

### Grant ZFS permissions

```sh
sudo zfs allow -u $(whoami) create,destroy,mount,snapshot hgst/lxc
```

Verify permissions:

```sh
zfs allow hgst/lxc
```
