# Mikrotik: First steps
## Disable admin user access from outside
## Configure NAT
```sh
/ip firewall nat
add chain=srcnat out-interface=outside action=masquerade
```
## Secure Router
```html
https://wiki.mikrotik.com/wiki/Manual:Securing_Your_Router
https://wiki.mikrotik.com/wiki/Bruteforce_login_prevention
```
## Traffic shaping for internet testing
```html
https://wiki.mikrotik.com/wiki/Manual:Queue
```
```sh
/queue simple 
add name=checkpoor target=192.168.1.0/24 max-limit=64K/64K 
add name=checkaverage target=192.168.1.0/24 max-limit=128K/128K 
```
## Download Winbox
```html
https://mikrotik.com/download#
```
## Add shutdown event
From ssh:
```sh
/system scheduler 
add name=”shutdown-tuesday” start-date=”apr/05/2022″ start-time=”18:01:00″ interval=”7d” on-event=”/system shutdown”
```
