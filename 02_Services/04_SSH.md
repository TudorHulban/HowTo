# Service SSH

## Install open ssh service

```sh
sudo dnf install openssh-server
```

### Start service

```sh
sudo systemctl start sshd
```

### Start service at boot

```sh
sudo systemctl enable sshd
```

### Verify service

```sh
systemctl status sshd
```

## Generate SSH key

```bash
ssh-keygen -t rsa -b 4096
```

## Copy file with SSH

Run on source host, file to send to target host:

```bash
scp file-to-send user@targethost:/path/to/place/file  # if custom port use -P port_number
```

Works also for transfer to local host. 

```bash
scp user@targethost:/path/to/place/file /local-path/to/file
```

Use `-r` for folders (recursive).

## Add SSH banner

### Enable banner in SSH configuration

```sh
sudo vim /etc/ssh/sshd_config
# uncomment show banner option, set path to message file
Banner /etc/mybanner
```

### Set banner text in banner path

```sh
sudo vi /etc/mybanner
```

### Restart SSH service

```sh
sudo systemctl restart sshd
```

## Update MOTD

```sh
sudo vim /etc/motd
```

Restart service.

## Custom MOTD

Modify script(s) in `/etc/update-motd.d`. Sample script below:

```sh
 #!/bin/sh
 echo "Hostname: $( hostname)"
 echo "Uptime:  $( uptime )"
```

Restart host.

## Enable root login without password

Add SSH key of user to login as root:

```sh
mkdir -p ~/.ssh
# add the desired key to trusted keys
vi ~/.ssh/authorized_keys
```

```sh
vim /etc/ssh/sshd_config
# update entry to the below
PermitRootLogin without-password
```

Restart service

```sh
systemctl restart sshd
```

## Resources

```html
https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server
https://www.ionos.com/digitalguide/server/configuration/linux-scp-command/
https://www.freecodecamp.org/news/scp-linux-command-example-how-to-ssh-file-transfer-from-remote-to-local/
https://www.ssh.com/ssh/sshd_config/
https://www.youtube.com/watch?v=N8f5zv9UUMI&t=363s
https://adminhacks.com/scp-not-port-22.html
```
