# NixOS

## Prerequisites

### Create partitions

With `fdisk` for SATA or `gdisk` for NVME create and format partitions on boot drive:

```sh
# A small EFI System Partition (/dev/sdX1, ~500MB, FAT32) if using UEFI.
# gdisk type: ef00
mkfs.fat -F 32 /dev/sdX1
# A Swap partition (/dev/sdX2, size depends on RAM).
# gdisk type: 8200
mkswap /dev/sdX2
# A Root partition (/dev/sdX3, remaining space, ext4 or other).
# gdisk type: 8300
mkfs.ext4 /dev/sdX3
```

### Mount partitions

```sh
mount /dev/sdX3 /mnt
mkdir /mnt/boot # Create boot mount point
mount /dev/sdX1 /mnt/boot # Mount EFI partition if using UEFI
swapon /dev/sdX2
```

### Generate Hardware Configuration

```sh
nixos-generate-config --root /mnt

# creates
/mnt/etc/nixos/hardware-configuration.nix
/mnt/etc/nixos/configuration.nix
```

### Minimal Configuration

See configuration.nix files in folder.

## Install

```sh
sudo nixos-install
```

## Updates

Configuration is moved into '/etc/nixos'.

```sh
sudo nixos-rebuild switch
```
