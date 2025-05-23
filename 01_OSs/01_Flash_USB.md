# Flash a USB in Linux

## For Windows ISO (UEFI boot BIOS)

### Option Ventoy

#### Installation

```sh
wget https://github.com/ventoy/Ventoy/releases/download/v1.0.95/ventoy-1.0.95-linux.tar.gz

tar -xzf ventoy-1.0.95-linux.tar.gz

cd ventoy-1.0.95

# sdX is USB drive
sudo ./Ventoy2Disk.sh -i /dev/sdX
```

#### Copy Files

```sh
sudo mkdir -p /mnt/ventoy

# mount USB to ventoy folder
sudo mount /dev/sdX1 /mnt/ventoy

# copy iso
sudo cp /path/to/your/windows.iso /mnt/ventoy/

sudo sync

sudo umount /mnt/ventoy
```

#### Clean deleted images

1. Connect the Ventoy drive to a computer.
2. Enable showing hidden files and folders in your operating system's file explorer settings.
3. Navigate to the Ventoy partition on the drive.
4. Look for hidden folders like .Trash-NNN (on Linux systems) or $RECYCLE.BIN (on Windows systems).
5. Open these folders and permanently delete the image files you thought you had removed.
6. Safely eject the Ventoy drive.

### Option BootIso

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
# oflag=dsync bypasses the kernel's page cache for output
sudo dd if=source.iso of=/dev/sdb bs=2M oflag=dsync status=progress 
```
