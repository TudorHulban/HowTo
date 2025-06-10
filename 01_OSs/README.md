# Linux OS Optimizations<a name="top"></a>

* [Date and Time](#time)
* [RAM and Disk](#ram)
* [SSH](#ssh)
* [File Management](#file)
* [Comms](#comms)
* [Media](#media)
* [Browser](#browser)
* [Office](#office)
* [Development](#dev)

## Date and Time <a name="time"></a> 

### Change timezone

```sh
sudo timedatectl set-timezone Europe/Bucharest
```

## RAM and Disk <a name="ram"></a> ([Up](#top))

### RAM Disk

One disk for general purpose which can be used also for Docker images. Consider changing mode to 777 for the created directories.

```sh
sudo mkdir /mnt/tmpfs.ramdisk

sudo vi /etc/fstab
tmpfs   /mnt/tmpfs.ramdisk  tmpfs  nodev,nosuid,nodiratime,size=500M 0  0

ln -s /mnt/tmpfs.ramdisk $HOME/ram  # can be removed later on with rm ram
```

Make terminal shortcut open in RAM disk:

```sh
/usr/bin/gnome-terminal --working-directory="/home/user/ram" 
xfce4-terminal --default-working-directory=/home/user/ram
```

### Disable swap

```sh
sudo swapoff -a
```

Permanent

```sh
vi /etc/fstab
# add /swap.img      none    swap    sw      0       0
```

### Decrease Swappiness

Debian based:

```sh
cat /proc/sys/vm/swappiness
sudo sysctl vm.swappiness=1
```

Alma Linux (does not work in Proxmox container):

```sh
sudo vi /etc/sysctl.conf
# add
vm.swappiness = 10
# apply
sudo sysctl -p
# verify
cat /proc/sys/vm/swappiness
```

#### Resources

```html
https://linuxhint.com/change_swap_size_ubuntu/
```

## SSH <a name="ssh"></a> ([Up](#top))

```sh
ssh-keygen -t rsa -C "your.email@example.com" -b 4096
xclip -sel clip < ~/.ssh/id_rsa.pub

# for another SSH key
ssh-keygen -t rsa -b 4096 -C "some@email.com" -f ~/.ssh/id_rsa_new_file
```

### Ports in use

```sh
ss -lntup
```

## File Management <a name="file"></a> ([Up](#top))

### Midnight Commander

```sh
sudo apt install mc
```

### 7zip

```sh
sudo apt-get install p7zip-full p7zip-rar
```

### RAR

```sh
wget https://www.rarlab.com/rar/rarlinux-x64-5.7.1.tar.gz
```

Add rar path to PATH in $HOME/bashrc.

### Torrent Client

```sh
sudo apt install qbittorrent
```

### Disk burner XFBurn

```html
http://www.xfce.org/projects/xfburn
```

### QPDF

```html
https://launchpad.net/qpdfview
```

### Scan software

```html
sudo apt install simple-scan
```

### wine

```sh
sudo apt update
sudo apt-get install wine wine32 wine-stable
```

or

```sh
sudo dpkg --add-architecture i386 && sudo apt update
sudo apt install \
      wine \
      wine32 \
      wine64 \
      libwine \
      libwine:i386 \
      fonts-wine
```

### Move file from subfolders to upper folder

```hash
find -name *.mp4 -exec mv {} . \;
```

## Comms <a name="comms"></a> ([Up](#top))

### USB Tethering

```sh
apt install network-manager
```

#### Resources

```yaml
https://brave.com/linux/
```

### Firefox ESR

```sh
apt-get install firefox-esr
```

### TeamViewer

```html
https://www.teamviewer.com/en/download/linux/
```

### Remote Desktop like (under review)

server:

```html
https://wiki.x2go.org/doku.php/doc:installation:x2goserver
```

connecting client:

```html
https://wiki.x2go.org/doku.php/doc:installation:x2goclient
```

### Mikrotik Winbox

```sh
wget http://www.mikrotik.com/download/winbox.exe
wine winbox.exe
```

alternative for finding IPs on LAN:

```sh
nmap -sP 192.168.1.0-45
```

## Media <a name="media"></a> ([Up](#top))

### CHM Viewer

```sh
sudo apt install kchmviewer
```

### MPV Player

```sh
sudo apt install mpv
```

#### Configuration file

```sh
vi ~/.config/mpv/mpv.conf
# add
autofit-smaller=1024x768
```

### Color picker 

```sh
sudo apt-get install gpick
```

### Screen capture

http://shutter-project.org/downloads/

```sh
sudo add-apt-repository ppa:shutter/ppa
sudo apt-get update && sudo apt-get install shutter
```

remove:

```sh
sudo rm /etc/apt/sources.list.d/ppa_shutter_ppa_tara.list
```

### Sound converter

```html
https://soundconverter.org/
```

```sh
sudo apt install soundconverter
```

### Youtube downloader

```sh
sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
```

If any issues related to Python:

```sh
sudo ln -s /usr/bin/python3 /usr/bin/python
```

Resources

```html
https://www.makeuseof.com/download-youtube-videos-yt-dlp-linux-terminal/
```

## Browser <a name="browser"></a> ([Up](#top))

### Slimjet

Version 38.0.5.0 (Official Build) (64-bit).

### Brave

```sh
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
```

## Office <a name="office"></a> ([Up](#top))

### Enable numlock after boot 

See:

```html
https://askubuntu.com/questions/155679/how-to-enable-numlock-at-boot-time-for-login-screen
```

```sh
sudo apt install numlockx
sudo vi /etc/lightdm/lightdm.conf
# add line:
greeter-setup-script=/usr/bin/numlockx on
```

Check installed packages (also use for uninstall):

```sh
dpkg --get-selections | grep libre
```

### Keyboard shortcuts

```sh
vi ~/.bash_aliases
# add:
alias r2='rm -rf *'
```

Load new entries with bash or open new terminal window.

#### Terminal shortcut

For Ubuntu use below for opening at desired location:

```sh
gnome-terminal --working-directory=/mnt/tmpfs.ramdisk
```

### Calculator

```sh
sudo apt install galculator
```

### LibreOffice

Prerequisites:

```sh
sudo apt-get install -y software-properties-common
```

```sh
sudo apt-add-repository ppa:libreoffice/ppa
sudo apt update
sudo apt-get install libreoffice
# or
sudo apt-get install libreoffice-writer
# or
sudo apt-get install libreoffice-calc
# or
sudo apt-get install libreoffice-impress
```

## Development <a name="dev"></a> ([Up](#top))

### Git

Prerequisites:

```sh
sudo apt-get install build-essential
sudo apt-get update
sudo apt-get install git
# or
sudo apt install git-all
```

For GIT credential stores check: 

```html
https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage
```

### Markdown Editor

```html
http://pad.haroopress.com/
```

### Geany IDE

For fast file viewing.

### VirtualBox

```sh
sudo apt-get install dkms
wget http://download.virtualbox.org/virtualbox/5.2.14/virtualbox-5.2_5.2.14-123301~Ubuntu~bionic_amd64.deb
```

start headless:

```sh
vboxheadless --startvm <name>
```
