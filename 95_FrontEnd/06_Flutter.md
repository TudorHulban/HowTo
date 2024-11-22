# Flutter: Installation

## Prerequisites
OS: 8+ Gb RAM

### Install snap

```yaml
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
sudo dnf update -y

sudo dnf install snapd -y
sudo systemctl enable --now snapd.socket

sudo ln -s /var/lib/snapd/snap /snap
```

### Install VS Code

```yaml
sudo snap install --classic code # or code-insiders
```

### Install Chrome browser

```yaml
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install ./google-chrome-stable_current_*.rpm
```

### Install Android Studio

With snap:

```yaml
sudo snap install android-studio --classic
```

```sh
wget https://dl.google.com/dl/android/studio/ide-zips/3.0.1.0/android-studio-ide-171.4443003-linux.zip
unzip downloaded file
sudo mv android-studio /usr/local
# run
./usr/local/android-studio/studio.sh
```

### Custom installation
Install virtual device for emulator. Create link for x86 computers:
In /Android/Sdl/tools/lib run:

```sh
ln -s emulator emulator-x86
```

#### Install needed lbraries 

For ubuntu:

```sh
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
```

## Check dependencies

On new terminal:

```yaml
flutter doctor -v
```
