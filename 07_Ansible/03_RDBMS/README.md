## Playbooks creating:
- database name: devops
- user name: develop
- with password: develop

## MySQL DB
Target OS: Ubuntu 20.04
### Connect
Localhost as root:
```
/usr/bin/mysql -u root # -p is any password set
```
Show users:
```
SELECT User, Host, authentication_string FROM mysql.user;
```
Show databases:
```
show databases;
```

## Resources
```html
https://support.rackspace.com/how-to/install-mysql-server-on-the-ubuntu-operating-system/
```
