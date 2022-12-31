# Debian: OS Optimizations <a name="top"></a>
* [OS Version](#os)
* [Date and Time](#time)
* [RAM and Disk](#ram)
* [SSH](#ssh)
* [File Management](#file)
* [Comms](#comms)
* [Media](#media)
* [Office](#office)
* [Development](#dev)

## Check OS version <a name="os"></a> 
```
cat /etc/os-release # or
hostnamectl status
```
## Date and Time <a name="time"></a> 
### Change timezone:
```bash
sudo timedatectl set-timezone Europe/Bucharest
```

## RAM and Disk <a name="ram"></a> ([Up](#top))
### RAM Disk
One disk for general purpose and one for Docker images. Consider changing mode to 777 for the created directories.
```bash
sudo mkdir /mnt/tmpfs.ramdisk
sudo mkdir /mnt/tmpfs.docker
sudo vi /etc/fstab
tmpfs   /mnt/tmpfs.ramdisk  tmpfs  nodev,nosuid,nodiratime,size=100M 0  0
tmpfs   /mnt/tmpfs.docker tmpfs  nodev,nosuid,nodiratime,size=9100M 0  0
ln -s /mnt/tmpfs.ramdisk $HOME/ram  # can be removed later on with rm ram
```
Make terminal shortcut open in RAM disk:
```bash
/usr/bin/gnome-terminal --working-directory="/home/user/ram" 
xfce4-terminal --default-working-directory=/home/user/ram
```
### Disable swap
```bash
sudo swapoff -a
```
Permanent
```bash
vi /etc/fstab
# add /swap.img      none    swap    sw      0       0
```
### Decrease Swappiness
```bash
cat /proc/sys/vm/swappiness
sudo sysctl vm.swappiness=1
```
#### Resources
```html
https://linuxhint.com/change_swap_size_ubuntu/
```
## SSH <a name="ssh"></a> ([Up](#top))
```bash
ssh-keygen -t rsa -C "your.email@example.com" -b 4096
xclip -sel clip < ~/.ssh/id_rsa.pub
```
### Ports in use
```sh
ss -lntup
```
## File Management <a name="file"></a> ([Up](#top))
### Midnight Commander
```bash
sudo apt install mc
```
### 7zip
```bash
sudo apt-get install p7zip-full p7zip-rar
```
### RAR
```bash
wget https://www.rarlab.com/rar/rarlinux-x64-5.7.1.tar.gz
```
Add rar path to PATH in $HOME/bashrc.
### Torrent Client
```bash
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
```bash
sudo apt update
sudo apt-get install wine wine32 wine-stable
```
or
```bash
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
```bash
apt install network-manager
```
### Browser with Ad-blocker
```bash
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
```
No cache option for RAM disk as per October 2020.
#### Resources
```
https://brave.com/linux/
```
### Firefox ESR
```bash
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
```bash
wget http://www.mikrotik.com/download/winbox.exe
wine winbox.exe
```
alternative for finding IPs on LAN:
```bash
nmap -sP 192.168.1.0-45
```

## Media <a name="media"></a> ([Up](#top))
### CHM Viewer
```sh
sudo apt install kchmviewer
```
### MPV Player
```bash
sudo apt install mpv
```
#### Configuration file
```
vi ~/.config/mpv/mpv.conf
# add
autofit-smaller=1024x768
```
### Color picker 
```bash
sudo apt-get install gpick
```
### Screen capture
http://shutter-project.org/downloads/
```bash
sudo add-apt-repository ppa:shutter/ppa
sudo apt-get update && sudo apt-get install shutter
```
remove:
```bash
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
```bash
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```
If any issues related to Python:
```bash
sudo ln -s /usr/bin/python3 /usr/bin/python
```
Resources
```html
https://ytdl-org.github.io/youtube-dl/download.html
```

## Office <a name="office"></a> ([Up](#top))
### Enable numlock after boot 
See:
```html
https://askubuntu.com/questions/155679/how-to-enable-numlock-at-boot-time-for-login-screen
```
```bash
sudo apt install numlockx
sudo vi /etc/lightdm/lightdm.conf
# add line:
greeter-setup-script=/usr/bin/numlockx on
```
Check installed packages (also use for uninstall):
```sh
dpkg --get-selections | grep libre
````
### Keyboard shortcuts
```bash
vi ~/.bash_aliases
# add:
alias r2='rm -rf *'
```
Load new entries with bash or open new terminal window.
### Calculator
```bash
sudo apt install galculator
```
### LibreOffice
Prerequisites:
```bash
sudo apt-get install -y software-properties-common
```
```bash
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
```bash
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
```bash
sudo apt-get install dkms
wget http://download.virtualbox.org/virtualbox/5.2.14/virtualbox-5.2_5.2.14-123301~Ubuntu~bionic_amd64.deb
```
start headless:
```bash
vboxheadless --startvm <name>
```
