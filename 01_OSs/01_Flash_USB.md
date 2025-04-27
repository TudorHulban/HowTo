# Flash a USB in Linux

## For Windows ISO (UEFI boot BIOS)

### Option A

```sh
# dependencies
sudo dnf install git p7zip-plugins wget

sudo dnf install python3-pip
pip3 install WoeUSB-ng

sudo woeusb --target-filesystem NTFS --device path/to/windows.iso /dev/sdX
```

### Option B

```sh
sudo apt install extlinux

curl -L https://git.io/bootiso -O

chmod +x bootiso
sudo ./bootiso <image.iso>
```

### Linux ISO

```html
https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.1.0-amd64-netinst.iso
```

### Linux CLI

```sh
sudo dd if=[path_to_iso] of=[path_to_usb]
# example, use block size for faster time
sudo dd if=/home/slick/Downloads/debian-10.1.0-amd64-netinst.iso of=/dev/sdb bs=2M status=progress
```
