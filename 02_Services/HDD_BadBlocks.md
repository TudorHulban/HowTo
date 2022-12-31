## Install HDD smart tools
```bash
sudo apt install smartmontools 
```
Install gsmartcontrol
```bash
sudo apt install gsmartcontrol
```
## List drives and status
```bash
sudo fdisk -l
sudo smartctl -i /dev/sdx
```
## Wipe disk
In blocks of 1Mb, this should allow disk to remap bad sectors if reserve sectors still are.
```bash
sudo dd if=/dev/zero of=/dev/xxx bs=1M # should take about 2 hours
```
