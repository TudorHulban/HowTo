## Create ZFS RAID 0 pool
If ZFS is not installed:
```bash
sudo apt-get install zfsutils-linux
```
Create pool
```bash
sudo zpool list
sudo zpool create -f -o ashift=12 maxtor /dev/sdb /dev/sdc /dev/sdd  # raid 0
```
Mount pool
```
sudo zfs set mountpoint=/maxtor maxtor
```
Change ownership to make it accesible
```
sudo chown -R tudi:tudi /maxtor/
```
