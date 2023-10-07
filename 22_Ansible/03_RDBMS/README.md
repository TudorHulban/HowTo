# Playbooks creating

- database name: devops
- user name: develop
- with password: develop

## MySQL DB

Target OS: Ubuntu 20.04

### Connect

Localhost as root:

```sh
/usr/bin/mysql -u root # -p is any password set
```

Show users:

```sql
SELECT User, Host, authentication_string FROM mysql.user;
```

Show databases:

```sql
show databases;
```

## Resources

```html
https://support.rackspace.com/how-to/install-mysql-server-on-the-ubuntu-operating-system/
```
