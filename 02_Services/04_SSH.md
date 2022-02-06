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

## Resources
```
https://www.ssh.com/ssh/sshd_config/
https://www.youtube.com/watch?v=N8f5zv9UUMI&t=363s
https://adminhacks.com/scp-not-port-22.html
```
