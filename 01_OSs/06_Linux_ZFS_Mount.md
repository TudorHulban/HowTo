# ZFS

## Install

```sh
sudo apt-get install zfsutils-linux

# alpine
sudo apk add zfs
modprobe zfs # load the zfs kernel module
echo "zfs" >> /etc/modules # as root, loads zfs module at boot
```

## Create ZFS RAID 0 pool

### Create pool

```sh
sudo zpool list
sudo zpool create -f -o ashift=12 pool-name /dev/sdb /dev/sdc /dev/sdd  # raid 0

# alpine
sudo zpool create -f pool-name /dev/sda /dev/sdb

# bring the pool up at boot
sudo rc-update add zfs-import default
sudo rc-update add zfs-mount default
```

### Delete pool

Any issues:

```sh
zpool export <poolname> # unmount pool
zpool destroy <poolname>
```

### Mount pool

```sh
sudo zfs set mountpoint=/maxtor maxtor
```

### Change ownership to make it accesible

```sh
sudo chown -R user:user /pool-name/
```

## Use created pool with LXC

```sh
sudo zfs create mypool/lxc
# verify
sudo zfs list
# add to configuration
sudo mkdir -p /etc/lxc
echo "lxc.bdev.zfs.root = mypool/lxc" | sudo tee -a /etc/lxc/lxc.conf
```
