# Rocky Linux 9.4

### 1. download
```sh
wget https://download.rockylinux.org/pub/rocky/9/isos/x86_64/Rocky-9.4-x86_64-minimal.iso
```

### 2. fractional scaling
```sh
sudo dnf install gnome-tweaks 
```

### 3. no kernel updates
```sh
vi  /etc/dnf/dnf.conf
# add
exclude=kernel*
```

### 4. vs code install
```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf -y install code
```
