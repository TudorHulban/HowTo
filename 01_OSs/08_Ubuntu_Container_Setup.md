# Ubuntu Container Setup

## Hostname

Current:

```sh
hostnamectl
```

New one:

```sh
sudo hostnamectl set-hostname host.example.com
```

### Resources

```html
https://linuxize.com/post/how-to-change-hostname-on-ubuntu-20-04/
```

## Fixed IP

See: [move to static IP](https://github.com/TudorHulban/HowTo/blob/cbacea100ded584484a05b7737e2933df24e599e/15_Proxmox/README.md/#14-move-to-static-ip)

## Install ping

```sh
sudo apt install iputils-ping
```