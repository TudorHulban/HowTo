# Rocky Linux 9.4

## 1. download

```sh
wget https://download.rockylinux.org/pub/rocky/9/isos/x86_64/Rocky-9.4-x86_64-minimal.iso
```

## 2. gnome install

```sh
https://www.tecmint.com/install-gui-desktop-rocky-linux-9/
```

## 3. fractional scaling

```sh
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
```

see https://www.omglinux.com/how-to-enable-fractional-scaling-fedora/

if does not work:

```sh
sudo dnf install gnome-tweaks 
```

## 4. no kernel updates

```sh
vi  /etc/dnf/dnf.conf
# add
exclude=kernel*
```

## 5. development tools

```sh
sudo dnf group install "Development Tools"
```

see https://www.golinuxcloud.com/install-gcc-on-rocky-linux/

## 6. vs code install

```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf -y install code
```

## 7. NTFS support

```sh
sudo dnf install epel-release
sudo dnf install ntfs-3g
```

## 8. SSH connection

see https://linuxcapable.com/how-to-install-ssh-on-rocky-linux/

## 9. Video codecs

see https://computingforgeeks.com/install-use-ffmpeg-on-rocky-alma-9/

## 10. Docker

see https://reintech.io/blog/installing-docker-on-almalinux-9

## 11. Zoom (Rocky 10)

Download generic Linux version.

Untar to $HOME:

```sh
tar -xvJf zoom_x86_64.tar.xz -C ~/opt
```

Get icon to zoom folder:

```sh
wget https://st1.zoom.us/zoom.ico
```

Create desktop entry in `~/.local/share/applications/`:

```yaml
[Desktop Entry]
Name=Zoom
Comment=Zoom Video Conference
Exec=/home/$USER/opt/zoom/ZoomLauncher %U
Icon=/home/$USER/opt/zoom/zoom.ico
Terminal=false
Type=Application
Categories=Network;VideoConference;
MimeType=x-scheme-handler/zoommtg;x-scheme-handler/zoomphonecall;x-scheme-handler/zoomus;
StartupWMClass=zoom
```

Register MIME types

```sh
xdg-mime default zoom.desktop x-scheme-handler/zoommtg
xdg-mime default zoom.desktop x-scheme-handler/zoomphonecall
xdg-mime default zoom.desktop x-scheme-handler/zoomus
```

## 12. gcc 

```sh
sudo dnf install gcc -y
```
