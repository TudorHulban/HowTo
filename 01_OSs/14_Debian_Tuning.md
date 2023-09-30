# Debian Tuning<a name="top"></a>
* [Download ISO](#download)
* [Install Windows Manager](#lxqt)
* [NEOVIM Customization](#vim)
* [WINE](#wine)
* [Check Running Services](#check)
* [Optimizations](#optim)

## Download <a name="download"></a>
```bash
wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.3.0-amd64-netinst.iso
```

Mandatory set mirror - mirror would enable all options for install. Check only system utilities and ssh server.

## Install Windows Manager <a name="lxqt"></a>  ([Up](#top))
```bash
apt install lxqt
# or for minimal
apt install -y lxqt-core      # LXQT, display manager needed: apt install lightdm
apt install -y lxde-core      # LXDE
```
## NEOVIM <a name="vim"></a>  ([Up](#top))
```bash
apt install -y sudo neovim
vi .vimrc  
# for user and root (sudo), add:
colo desert
set number
```

## WINE <a name="wine"></a>  ([Up](#top))
```bash
sudo dpkg --add-architecture i386 && sudo apt update
sudo apt install wine wine32 wine64 libwine libwine:i386 fonts-wine
```
### Check version
```
wine --version
```
## Check services <a name="check"></a>  ([Up](#top))
### Per Run Level
```bash
ls /etc/rc*.d
```
### Systemd
```bash
service --status-all | grep '\[ + \]'
# disable with
sudo systemctl disable bluetooth.service
# verify with
sudo systemctl status bluetooth.service
```
## Optimizations <a name="optim"></a>  ([Up](#top))

```bash
apt install -y lxterminal gdebi galculator sudo xfburn soundconverter mc p7zip-full qpdfview qbittorrent geany
apt autoremove -y termit lxtask nano
# or
apt purge lxlock
```

If preferences not saved make sure file exists and user owns:

```vim
~/.config/lxterminal
~/.config/lxterminal/lxterminal.conf
```

LXTerminal is a non-login shell. 
The start-up script is ~/.bashrc, not ~/.bash_profile or ~/.profile.

### Check memory
```
sudo dmidecode --type 17
```

## Create desktop entries  ([Up](#top))
```
vi <shortcut>

[Desktop Entry]
Version=1.0
Encoding=UTF-8
Type=Application
Icon=/home/tudi/Pictures/Hopstarter-Sleek-Xp-Basic-Folder.ico
Exec=pcmanfm -n "/media/tudi/system/01_ToRead/Go_Books (from vault)"
Name=Go
GenericName=Go
```
## Static IP
```yaml
auto ens18
iface ens18  inet static
address 192.168.1.130
netmask 255.255.255.0
gateway 192.168.1.1
dns-nameservers 1.1.1.1
```
## Resources
```
https://techguides.yt/guides/secure-linux-server/
```
