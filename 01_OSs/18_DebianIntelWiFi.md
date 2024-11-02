# Debian - Intel WiFi

## 1. Install Debian with system utilities

## 2. As root (su -)

Make sure you have root $PATH. Add non free repo

```sh
vi /etc/apt/sources.list
# add: deb http://httpredir.debian.org/debian/ buster main contrib non-free
```

Add wireless support:

```sh
apt-get update && apt-get install firmware-iwlwifi
modprobe -r iwlwifi ; modprobe iwlwifi
```

## 3. Install wicd

```sh
apt install wicd
```

## 4. Verify

Connect with wicd. Verify with:

```sh
iwconfig  # if Tx-Power > 0 the WiFi card is working
```
