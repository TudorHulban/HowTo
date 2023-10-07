# Flutter: Installation
## Prerequisites
OS: 8+ Gb RAM

## Install Android Studio
```bash
wget https://dl.google.com/dl/android/studio/ide-zips/3.0.1.0/android-studio-ide-171.4443003-linux.zip
unzip downloaded file
sudo mv android-studio /usr/local
# run
./usr/local/android-studio/studio.sh
```
### Custom installation
Install virtual device for emulator. Create link for x86 computers:
In /Android/Sdl/tools/lib run:
```bash
ln -s emulator emulator-x86
```
#### Install needed lbraries for ubuntu 64b
```bash
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
```
#### Install Flutter repo in Android Studio
After Android Studio restart, install Flutter SDK.
