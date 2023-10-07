## Install
Set environment variables first.<br/>

Vagrant is currently configured to create VirtualBox synced folders with
the `SharedFoldersEnableSymlinksCreate` option enabled. If the Vagrant
guest is not trusted, you may want to disable this option. For more
information on this option, please refer to the VirtualBox manual:

This option can be disabled globally with an environment variable:
```
VAGRANT_DISABLE_VBOXSYMLINKCREATE=1
```
```
wget https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb
sudo gdebi downloaded_file
```
## Verify
```
vagrant --version
```
## Install disk size plugin
```
vagrant plugin install vagrant-disksize
```
## Resources
```
https://www.vagrantup.com/downloads
https://stackoverflow.com/questions/49822594/vagrant-how-to-specify-the-disk-size#51064467
```
