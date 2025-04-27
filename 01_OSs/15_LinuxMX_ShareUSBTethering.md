# Linux MX - Share USB tethering from phone

## 1. Phone network entry is usb0

## 2. Ethernet card is eth0, IP 192.168.1.5/24 (static)

## 3. Share usb0 network connection

Might not be needed.

```sh
nmcli connection add type ethernet ifname usb0 ipv4.method shared con-name local
```

## 4. Enable IP forwarding

```sh
sudo sysctl -w net.ipv4.ip_forward=1
```

## 5. Enable masquerading on usb0.

```sh
sudo iptables -t nat -A POSTROUTING -o usb0 -j MASQUERADE
```

## 6. Accept and forward traffic.

```sh
sudo iptables -I FORWARD -o usb0 -s 192.168.0.0/16 -j ACCEPT
sudo iptables -I INPUT -s 192.168.0.0/16 -j ACCEPT
```

## 7. Configure connecting computers with default gateway as eth0 IP address

Restart network service on connecting machines.  
Test.

## Resources

```html
https://medium.com/@TarunChinmai/sharing-internet-connection-from-a-linux-machine-over-ethernet-a5cbbd775a4f
https://fedoramagazine.org/internet-connection-sharing-networkmanager/
```
