# MariaDB: Install and first steps

## Install

```sh
sudo apt install -y mariadb-server
```

### With Docker

```sh
docker run --name mariadbtest -e MYSQL_ROOT_PASSWORD=passwd -p 3306:3306 -d docker.io/library/mariadb:10.4
```

## Get status

```sh
systemctl status mariadb
# sudo systemctl restart mariadb.service
# sudo systemctl enable mariadb.service
```

## Get version

```sh
mariadb --version
```

## Security Configuration (optional)

```sh
sudo mysql_secure_installation
```

By default, MariaDB on Ubuntu uses unix_socket to authenticate user login.
Basically you can use username and password of the OS to log into MariaDB console:

```sh
sudo mariadb -u root
```

## Create Database

a. connect with root <br/>
b. create database <db_name> default character set utf8 default collate utf8_bin; <br/>
c. SHOW DATABASES LIKE 'db_name%'; <br/>

## Create User

a. grant access locally

```sql
GRANT ALL PRIVILEGES ON db_name.* to user_name@'localhost' IDENTIFIED BY 'user_password';
```

b. grant access from any other host

```sql
GRANT ALL PRIVILEGES ON db_name.* to user_name@'%' IDENTIFIED BY 'user_password';
```

c. verify

```sql
show grants for user_name;
```

## Get more info

```sql
SHOW STATUS;
SHOW VARIABLES;
```

## Allow remote connections

a. update server configuration

```sh
sudo vi /etc/mysql/mariadb.conf.d/50-server.cnf
# change: bind-address = 127.0.0.1 to bind-address = 0.0.0.0
```

Restart service:

```sh
sudo systemctl restart mariadb.service
```

b. check socket has opened:

```sh
sudo apt-get install net-tools
sudo netstat -anp | grep 3306
```
