# LXD Containers Operations

## Start - Stop - Delete
```bash
lxc start c001
lxc stop c001
lxc delete c001 c002 --force
```

## Edit description
```bash
lxc config edit <container>
lxc config show <container>
```

## Execute commands externally

### Add user to connect remotely
```bash
lxc exec c001 adduser ansible
```

### Add created user to sudoers list
```bash
sudo visudo
# add 
ansible ALL=(ALL:ALL) NOPASSWD:ALL
```

### Install openssh-server
```bash
lxc exec c001 apt-get install openssh-server
```

## Files
```bash
lxc file pull c001/path/to/file .
lxc file push /path/to/file c001/
```

## Copy Container
```bash
lxc copy source_container destination_container
```

## Change timezone
```bash
lxc config set c001 environment.TZ Europe/Bucharest
lxc exec c001 timedatectl set-timezone Europe/Bucharest
```

## Enter created container
```bash
lxc exec c001 /bin/bash   # for Alpine /bin/ash
```

## Deploy SSH key
Make VI default editor:
```bash
vi ~/.bashrc and add line: export EDITOR=vi
lxc profile edit MyContainerProfile
```
Check: https://chrismacnaughton.com/blog/uncategorized/adding-ssh-authorized-keys-to-lxd-default-profile/

## Enable SSH key based authentication
Configure local public key as authorized key in container:
```bash
cat ~/.ssh/id_rsa.pub | ssh username@remote_host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```
Check: 
```html
https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server
```

Add user to sudoers list:
```bash
sudo adduser <username> sudo
```

## Troubleshooting
### Listening ports
Have `net-tools` package installed:
```sh
sudo apt install net-tools
```

Verify listening ports:
```
netstat -tunlp
```

### Connecting to containers
Topology:<br/>
Local workstation: 192.168.1.5 <br/>
Remote server hosting containers: 192.168.1.7 <br/>
Container running web server on port 80: 10.208.176.115 <br/>

To connect issue below SSH port forwarding that will remain as long as SSH session opened:<br/>
```sh
ssh -L 8888:10.208.176.115:80 192.168.1.7
```
Maps remote port to local 8888.

#### Resources
```
https://linuxize.com/post/check-listening-ports-linux/
```
