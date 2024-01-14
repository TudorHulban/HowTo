# ZFS

## Install

```sh
sudo apt-get install zfsutils-linux
```

## Create ZFS RAID 0 pool

### Create pool

```sh
sudo zpool list
sudo zpool create -f -o ashift=12 pool-name /dev/sdb /dev/sdc /dev/sdd  # raid 0
```

### Mount pool

```sh
sudo zfs set mountpoint=/maxtor maxtor
```

### Change ownership to make it accesible

```sh
sudo chown -R user:user /pool-name/
```
