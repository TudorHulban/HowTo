# gitea.service

Copy file in `/etc/systemd/system/gitea.service`.

```bash
[Unit]
Description=Gitea (Git with a cup of tea)
After=syslog.target
After=network.target
###
# Don't forget to add the database service requirements
###
#
#Requires=mysql.service
#Requires=mariadb.service
#Requires=postgresql.service
#Requires=memcached.service
#Requires=redis.service
#
###
# If using socket activation for main http/s
###
#
#After=gitea.main.socket
#Requires=gitea.main.socket
#
###
# (You can also provide gitea an http fallback and/or ssh socket too)
#
# An example of /etc/systemd/system/gitea.main.socket
###
##
## [Unit]
## Description=Gitea Web Socket
## PartOf=gitea.service
##
## [Socket]
## Service=gitea.service
## ListenStream=80
## NoDelay=true
##
## [Install]
## WantedBy=sockets.target
##
###

[Service]
# Modify these two values and uncomment them if you have
# repos with lots of files and get an HTTP error 500 because
# of that
###
#LimitMEMLOCK=infinity
#LimitNOFILE=65535
RestartSec=2s
Type=simple
User=git
Group=git
WorkingDirectory=/var/lib/gitea/
# If using Unix socket: tells systemd to create the /run/gitea folder, which will contain the gitea.sock file
# (manually creating /run/gitea doesn't work, because it would not persist across reboots)

#RuntimeDirectory=gitea
ExecStart=/usr/local/bin/gitea web -p 80 --config /etc/gitea/app.ini
Restart=always
Environment=USER=git HOME=/home/git GITEA_WORK_DIR=/var/lib/gitea

# If you install Git to directory prefix other than default PATH (which happens 
# for example if you install other versions of Git side-to-side with 
# distribution version), uncomment below line and add that prefix to PATH 
# Don't forget to place git-lfs binary on the PATH below if you want to enable 
# Git LFS support 
#Environment=PATH=/path/to/git/bin:/bin:/sbin:/usr/bin:/usr/sbin 
# If you want to bind Gitea to a port below 1024, uncomment 
# the two values below, or use socket activation to pass Gitea its ports as above 
### 
CapabilityBoundingSet=CAP_NET_BIND_SERVICE 
AmbientCapabilities=CAP_NET_BIND_SERVICE 
### 
 
[Install] 
WantedBy=multi-user.target
```

## Resources
```
https://docs.gitea.io/en-us/linux-service/
```
