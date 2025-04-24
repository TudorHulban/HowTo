# ZFS: Installation and first steps

Make sure the drives are connected on motherboard in the order of that the controller presents.

## Install ZFS

For Ubuntu:

```sh
sudo apt install zfsutils-linux 
```

### For Debian Buster

Under review.

## List available disks and pools

```sh
sudo fdisk -l  # or lsblk
sudo zpool list
```

## Create aliases for drives

For the case where the drives in the pool get unpluged.

```sh
cd /dev/disk/by-id
ll ata* -ltr

sudo vi /etc/zfs/vdev_id.conf
```

Add:

```sh
alias 01   /dev/disk/by-id/disk identifier as per ll ata* -ltr
```

Apply the aliases:

```sh
sudo udevadm trigger
```

Check aliases:

```sh
cd /dev/disk/by-vdev
```

## Create mirror pool

```sh
sudo zpool create -f -o ashift=12 <pool name> mirror /dev/sda /dev/sdb
# with aliases
sudo zpool create <pool name> mirror 01 02
```

Check created pool:

```sh
sudo zpool status <pool name> 
sudo zfs get all 
zpool list -v
```

## Create pool raid 0:

```sh
sudo zpool create -f -o ashift=12 <pool name> <device1> <device2>
sudo zpool create -f -o ashift=12 labo /dev/sda /dev/sdb
```

## For Proxmox

After pool creation go to Datacenter/Storage and add the ZFS volume.<br/>

### List container images:

```sh
pveam update
pveam available --section system
```

### Download image

```sh
pveam download local <image name>
```

### Connect:

```sh
ssh -l root 192.168.1.xxx
```

For OSs connect with Filezilla, SFTP using root to /var/lib/vz/template/iso the needed ISO.

### Delete all datasets or pool

```sh
sudo zfs destroy -r <pool name>
sudo zpool destroy <pool name>
```

### Get pool speed

```sh
sudo /usr/bin/time --verbose dd if=/dev/zero of=sometestfile bs=1024 count=30000
```

More: https://blog.programster.org/zfs-cheatsheet

### Stats

```sh
zpool iostat -v
```
