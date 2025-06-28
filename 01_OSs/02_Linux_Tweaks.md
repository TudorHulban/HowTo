# Linux Tweaks<a name="top"></a>

* [Extract Audio](#video)
* [X Type](#x)
* [Grep](#grep)
* [GB Written](#written)
* [LOC](#loc)
* [MOTD](#motd)
* [New hard drive](#new)
* [Mount Disk](#mount)
* [No sleep when docked](#dock)
* [Running Services](#services)
* [Other Tweaks](#other)
* [Terminal Colors](#colors)

## Extract Audio from video file <a name="video"></a> 

```sh
ffmpeg -i videofile.mp4 -vn -acodec copy audiotrack.m4a
```

## X Type <a name="x"></a> ([Up](#top))

```sh
ls /usr/bin/*session
```

## Grep <a name="grep"></a> ([Up](#top))

```sh
grep -rnw '/path/to/somewhere/' -e 'pattern'
# -r or -R is recursive,
# -n is line number,
# -w stands for match the whole word,
# -l (lower-case L) can be added to just give the file name of matching files.
```

## GB Written <a name="written"></a> ([Up](#top))

### For SSD

```sh
sudo smartctl -A /dev/sda | awk '/^241/ { print "GBW: "($10 * 1024) * 1.0e-5, "GB" } '
```

### For NVME

Install utility:

```sh
sudo apt install nvme-cli
```

and check:

```sh
nvme list
nvme smart-log /dev/nvme0
```

## Lines of Code <a name="loc"></a> ([Up](#top))

```sh
sudo apt install cloc
```

Make script cloc-git and place in path, chmod +x:

```sh
#!/usr/bin/env bash
git clone --depth 1 "$1" temp-linecount-repo &&
  printf "('temp-linecount-repo' will be deleted automatically)\n\n\n" &&
  cloc temp-linecount-repo &&
  rm -rf temp-linecount-repo
```

Usage:

```sh
cloc-git https://github.com/evalEmpire/perl5i.git
```

## Update MOTD <a name="motd"></a> ([Up](#top))

```sh
cd /etc/update-motd.d
sudo mkdir _scripts
sudo mv needed scripts to _scripts
```

## Add New hard drive to OS <a name="new"></a> ([Up](#top))

### Mac OS compatibility

Format as exFAT. Support in:

```sh
sudo dnf install exfatprogs
```

### Check Disk

```sh
sudo apt install smartmontools
sudo smartctl -a /dev/sdx
````

### Partitioning

#### Create Partition

```sh
lsblk   # to identify drive
fdisk /dev/sdc
# create new gpt label
# create new partition <n>
```

#### Format Partition

```sh
sudo mkfs.ext4 -L datapartitionlabel /dev/sdX1
sudo mkfs.vfat -F32 /dev/sdX1
```

## Permanently mount disk <a name="mount"></a> ([Up](#top))

```sh
sudo lsblk --fs # get UUID
sudo vi /etc/fstab
# add partition, see https://en.wikipedia.org/wiki/Fstab
UUID=xxxxxxx /home/xxx/diskx ext4 defaults 0 2
```

If mount folder does not exist it will be created. Save. reboot and verify with:

```sh
df -h  # or
sudo fdisk /dev/sdx  # and p
sudo hdparm -I /dev/sdx
```

### Resources

```html
https://www.digitalocean.com/community/tutorials/how-to-partition-and-format-storage-devices-in-linux
```

## Prevent laptop going to sleep when docked <a name="dock"></a> ([Up](#top))

```sh
sudo vi /etc/systemd/logind.conf
HandleLidSwitch=ignore
HandleLidSwitchDocked=ignore
# save run below and test
sudo service systemd-logind restart
```

## Check all running services <a name="services"></a> ([Up](#top))

```sh
service --status-all
systemctl --type=service --state=active list-units
```

## Other Tweaks <a name="other"></a> ([Up](#top))

```html
https://dev.to/javinpaul/10-simple-linux-tips-which-save-50-of-my-time-in-the-command-line-4moo?utm_source=digest_mailer&utm_medium=email&utm_campaign=digest_email
```

### Frequency per each core

```sh
grep "cpu MHz" /proc/cpuinfo | awk -F: '{print $2}' | awk '{printf "Core %s: %.2f MHz\n", NR-1, $1}'
```

### Remove IP Tables (5 - 15% more performance)

```sh
sudo apt purge iptables
```

### Remove Mitigations

```sh
https://leochavez.org/index.php/2020/11/16/disabling-intel-and-amd-cpu-vulnerability-mitigations/
```

### Disable Apparmor

```sh
https://www.simplified.guide/ubuntu/remove-apparmor
```

### GRUB timeout not working

```sh
sudo vi /etc/default/grub
# add at the end of file
GRUB_RECORDFAIL_TIMEOUT=$GRUB_TIMEOUT
sudo update-grub
```

see more in https://www.shellhacks.com/grub_timeout-change-not-working/ .

## Terminal Colors <a name="colors"></a> ([Up](#top))

Tested on Ubuntu GNOME (.bashrc)

### Prompt Colors

```sh
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;37m\]\w\[\033[00m\]\$ '
```

### Directory Colors

```sh
LS_COLORS=$LS_COLORS:'di=0;37:' ; export LS_COLORS
```

### Shortcut

```sh
/usr/bin/gnome-terminal --working-directory="/home/tudi/ram"
# Rocky 10
sh -c "ptyxis -x 'bash -c \"source ~/.bashrc && cd /mnt/tmpfs.ramdisk && exec bash\"'"
```

## Linux MX

Clear unused apps.

```sh
sudo apt autoremove gnome-mahjongg lbreakout2 peg-e swell-foop
```

## Slimjet

Missing `libappindicator1`

```sh
curl -p --insecure "http://ftp.de.debian.org/debian/pool/main/liba/libappindicator/libappindicator1_0.4.92-7_amd64.deb" --output libappindicator1_0.4.92-8_amd64.deb \
    && curl -p --insecure "http://ftp.de.debian.org/debian/pool/main/libi/libindicator/libindicator7_0.5.0-4_amd64.deb" --output libindicator7_0.5.0-4_amd64.deb \
    && dpkg -i libindicator7_0.5.0-4_amd64.deb \
    && dpkg -i libappindicator1_0.4.92-8_amd64.deb \
    && rm libindicator7_0.5.0-4_amd64.deb \
    && rm libappindicator1_0.4.92-8_amd64.deb
```

## Renaming parts of files

Old file: SvelteKit Tutorial - 1 - Introduction [UOMLvxfrTCA].mp4   
New file: SvelteKit Tutorial - 1 - Introduction .mp4

```sh
#!/bin/bash
for i in *; do
    echo "Old file: $i"
    new=$(echo "$i" | sed -e 's/\[[^]]*\]//g')
    echo "New file: $new"
    mv "$i" "$new"
done
```

## Resources

```html
https://askubuntu.com/questions/62858/turn-off-monitor-using-command-line
https://unix.stackexchange.com/questions/399739/disable-laptop-screen-and-use-only-vga
```
