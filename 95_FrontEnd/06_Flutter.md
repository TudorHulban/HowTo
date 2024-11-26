# Flutter - Installation

## Prerequisites

OS: 8+ Gb RAM

### Install snap

```yaml
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y
# do not do update if running on RAM disk as it takes 1.5G+ space
sudo dnf update -y

sudo dnf install snapd -y
sudo systemctl enable --now snapd.socket

sudo ln -s /var/lib/snapd/snap /snap
```

Add to configuration:  

```yaml
vi ~/.bashrc
export PATH=$PATH:/snap/bin
```

### Install VS Code

```yaml
sudo snap install --classic code # or code-insiders
```

### Install Chrome browser

```yaml
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install ./google-chrome-stable_current_*.rpm -y
```

### Install Android Studio

With snap:

```yaml
sudo snap install android-studio --classic
sudo snap install androidsdk
sudo snap install android-platform-tools # if needed, install from sdk manager
sudo snap install android-adb --edge --devmode # might not be needed
```

Open Android studio, do not create project, instead go to SDK Manager.  
Under SDK Tools should be installed:  
Android SDK Command-line Tools  
Android Emulator

#### Install needed lbraries

For ubuntu:

```sh
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
```

## Install Flutter

```yaml
sudo snap install flutter --classic
```

## Check dependencies

On new terminal:

```yaml
flutter doctor -v
```

Accept licenses one by one (review each one):

```yaml
flutter doctor --android-licenses
```
