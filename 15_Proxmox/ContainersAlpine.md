# Proxmox Containers: Alpine

Note: Ansible did not run on Alpine containers due to asking for password, although sudoers file on Alpine was updated.

## Connect to container

```sh
sudo pct enter 100
```

## Install openssh server

```sh
apk add openssh bash vim sudo # vi remains, must use vim <file>
/etc/init.d/sshd start # start the sshd service immediately and create configuration files:
rc-status              # list services to verify sshd is enabled:
rc-update add sshd     # add SSH at current run level
```

## Connect

```sh
ssh root@192.168.1.9   # uses SSH key in intialization
```

## Resources

```html
https://wiki.alpinelinux.org/wiki/Alpine_Linux_Init_System
```
