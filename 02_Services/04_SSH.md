## Keygen 4096 bits
```bash
ssh-keygen -t rsa -b 4096
```

## Copy file with SSH
Run on source host, file to send to target host:
```bash
scp file-to-send user@targethost:/path/to/place/file  # if custom port use -P port_number
```
Works also for transfer to local host. Run on remote host (SSH enabled on local host):
```bash
scp /path/to/file user@targethost:/path/to/place/file
```
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
## Resources
```
https://www.ssh.com/ssh/sshd_config/
https://www.youtube.com/watch?v=N8f5zv9UUMI&t=363s
https://adminhacks.com/scp-not-port-22.html
```
