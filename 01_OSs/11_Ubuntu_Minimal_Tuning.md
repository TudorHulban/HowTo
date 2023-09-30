# Ubuntu Minimal Tuning

## PING Install

```sh
sudo apt install iputils-ping
```

## Open Socket for Port Connectivity

### Install Tool

```sh
apt-get install netcat
```

### Test

Listen on socket, ports best to be above 1024.

```sh
netcat -l port
```

connect to opened socket:

```sh
netcat target-IP port
```

### Resources

```html
https://www.digitalocean.com/community/tutorials/how-to-use-netcat-to-establish-and-test-tcp-and-udp-connections
```