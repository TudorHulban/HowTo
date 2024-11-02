# Linux NFS support

## Install server

```sh
apt install nfs-common nfs-kernel-server
```

## Install client

```sh
apt install nfs-common 
```

## Run server

### Check NFS socket is opened:

```sh
rpcinfo -p | grep nfs
```

### Check NFS file system is supported:

```sh
modprobe nfs
cat /proc/filesystems | grep nfs  # should return nfs or nfs4
```

If yes create share:

```sh
mkdir /home/nfs
touch /home/nfs/xxx
```

### Add configuration

```sh
vi /etc/exports
/share-path 192.168.1.0 (rw,sync)
```

Load configuration:

```sh
service nfs-kernel-server restart
```

Verify configured shares are available:

```sh
showmount -e <NFS server IP>
```

### Run client

Mount locally:

```sh
mkdir /mnt/nfs 
sudo chmod 777 /mnt/nfs
mount <server IP>:/exported_share /mnt/nfs
```

Mount permanently:

```sh
vi /etc/fstab
# add:
<server IP>:/home/nfs /home/nfs_local/ nfs defaults 0 0 
```

Unmount:

```sh
sudo unmount /home/nfs_local/
```

Create soft link in home folder:

```sh
ln -s /mnt/nfs $HOME/nfs
```

Create entry for host for easier referral:

```sh
sudo vi /etc/hosts
```

### Resources

```html
https://askubuntu.com/questions/7117/which-to-use-nfs-or-samba
https://www.cyberciti.biz/faq/howto-see-shares-on-nfs-server-exported-filesystems/
https://www.howtoforge.com/tutorial/how-to-configure-a-nfs-server-and-mount-nfs-shares-on-ubuntu-18.04/
https://www.tecmint.com/setup-local-dns-using-etc-hosts-file-in-linux/
```
