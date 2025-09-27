# Trixie - from base to studio

## Install Cinamonn

Cinamonn was chosen as it is lighter than GNOME but has fractional scaling working.

```sh
sudo apt update
sudo apt install cinnamon-core
```

## Install wine 64

```sh
sudo apt install wine64
```

## Install wine 32

Install also 32 bit support for the windows target installers:

```sh
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libwine:i386
sudo apt-get install wine32:i386
```

### Installers run

Run on host that connects to the VM running Debian.

```sh
xhost +SI:localuser:local-user-name
```

Connect with X capabilities to the VM running Debian:

```sh
ssh -X remote-user-name@debian-vm-ip
```

Create a 32 bit wine installer:

```sh
WINEARCH=win32 WINEPREFIX=~/wine-installer winecfg
```

Run the app installer with the wine 32 installer:

```sh
WINEPREFIX=~/wine-installer wine app-setup.exe
```

## Reaper app run

Download:

```sh
wget https://www.reaper.fm/files/7.x/reaper747_x64-install.exe
```

Create wine hybrid installer (32 and 64 bit)

```sh
WINEARCH=win64 WINEPREFIX=~/wine-hybrid winecfg
```

Move the app to the new hybrid environment.  
Place it in `~/wine-installer/drive_c/Program\ Files/MyApp`.

Add an alias to run the app:

```sh
echo 'alias reaper="WINEPREFIX=$HOME/wine-hybrid wine '\''C:\Program Files\REAPER (x64)\reaper.exe'\''"' >> ~/.bashrc
source ~/.bashrc
```

## VSTs

### Create VST folder

Inside the wine hybrid environment:

```sh
mkdir -p ~/wine-hybrid/drive_c/vst
cd ~/wine-hybrid/drive_c/vst
```

### Download free VST

```sh
wget https://tal-software.com/downloads/plugins/install_TAL-Reverb-4.zip
```
