#### Wear
```bash
sudo apt install smartmontools
sudo smartctl -A /dev/sda | awk '/^241/ { print "GBW: "($10 * 1024) * 1.0e-5, "GB" } '
```
#### When OS was installed
```bash
sudo  tune2fs -l /dev/sda1 | grep 'Filesystem created:'
```
