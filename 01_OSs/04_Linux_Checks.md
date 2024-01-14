# Linux Checks<a name="top"></a>

* [OS Version](#os)
* [OS Installation](#installed)
* [SSD Wear](#wear)
* [RAM](#ram)

## 1. Check OS version <a name="os"></a> 

```sh
cat /etc/os-release # or
hostnamectl status
```

## 2. When OS was installed <a name="installed"></a> ([Up](#top))

```sh
sudo  tune2fs -l /dev/sda1 | grep 'Filesystem created:'
```

## 3. Check SSD wear for /dev/sd <a name="wear"></a> ([Up](#top))

### Install tool

```sh
sudo apt install smartmontools
```

### Check

```sh
sudo smartctl -A /dev/sda | awk '/^241/ { print "GBW: "($10 * 1024) * 1.0e-5, "GB" } '
```

## 4. Check RAM <a name="ram"></a> ([Up](#top))

```sh
sudo dmidecode --type memory
```