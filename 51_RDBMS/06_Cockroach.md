# Cockroach: Install and first steps
## Start as localhost to create database (only root can create database):
```sh
cockroach start --insecure --host=localhost
```
## Create database:
a. connect with sql client on same node: 
```sh
cockroach sql --insecure
```
b. CREATE DATABASE <db>;
## Create user to connect remotely
a. create user <user>; <br/>
b. grant create, select, insert on database <db> to <user>; <br/>
c. show grants on <db>;
## Start database for remote connection
```sh
cockroach start --insecure --host=1.1.1.1
```
## Resources
```html
https://www.cockroachlabs.com/docs/stable/install-cockroachdb.html
```
