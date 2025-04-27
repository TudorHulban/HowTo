# Alpine 3.2

## Linux support

```sh
sudo apk add lsof # ex. sudo lsof /mnt/media/
sudo apk add util-linux # ex. lsblk
sudo apk add exfatprogs # exFAT support
```

## Authorised keys

```sh
mkdir -p ~/.ssh
chmod 700 ~/.ssh

touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

## RAM disk

```sh
mkdir /mnt/ramdisk # Create a mount point

vi /etc/fstab
tmpfs   /mnt/ramdisk   tmpfs   defaults,size=1G   0   0
```

## Mount exFAT USB drive

```sh
sudo sh -c 'echo fuse >> /etc/modules' # for future
modprobe fuse
mount /dev/sdXN /mnt/usb
sudo umount /dev/sdxN
```

## History size

```sh
vi ~/.profile
export HISTSIZE=100
export HISTFILESIZE=100
```
