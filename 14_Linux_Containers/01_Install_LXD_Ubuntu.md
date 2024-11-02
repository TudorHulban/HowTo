# Linux Containers Ubuntu LTS LXD support

## Create ZFS RAID 0 pool

If ZFS is not installed:

```sh
sudo apt-get install zfsutils-linux
```

Create pool:

```sh
sudo zpool list
sudo zpool create -f -o ashift=12 toshiba /dev/sda /dev/sdb  # raid 0
sudo zpool create -f d7200 /dev/sdb  # one disk
```

Destroy with:

```sh
sudo zpool destroy <pool-name>
```

### Benchmark zfs pool

Enter container created on pool. Stop other VMs or containers.

```sh
# WRITE Speed
sync; dd if=/dev/zero of=tempfile bs=1M count=128; sync
# READ speed from buffer
dd if=tempfile of=/dev/null bs=1M count=128
# READ speed directly from the zpool
# flush cache on host before below: /sbin/sysctl -w vm.drop_caches=3
dd if=tempfile of=/dev/null bs=1M count=128
```

## Install LXD

LXD comes installed.

## Initialize LXD daemon

```sh
sudo lxd init
```

- Do you want to configure a new storage pool? yes
- Name of the new storage pool  lxdpool01
- Create a new ZFS pool? no
- Name of the existing ZFS pool or dataset toshiba

```sh
sudo zfs list
```

## Add images repo

```sh
lxc remote add lximages images.linuxcontainers.org
```

List available images:

```sh
lxc image list lximages: | grep bionic | grep amd64
```

## Create container (image cached locally)

```sh
lxc launch lximages:ubuntu/bionic/amd64 c001
```
