# PostgreSQL: Installation in Alpine
## Installation
As root:
```bash
apk add postgresql
/etc/init.d/postgresql start
# connect
psql -U postgres
# change postgres user password
alter user postgres with password 'admin';
\q
```
## Configuration
In /etc/postgresql:
```bash
# postgresql.conf, add listen_addresses = '*'
# pg_hba.conf, add host    all             all             192.168.1.0/24          password
```
Add service to current rc level:
```bash
rc-update add postgresql
# to verify configurations
reboot
```
Stop service:
```bash
rc-service postgresql stop
```
##### DDL
```sql
create table if not exists test(id int, uploadedfile bytea);
```
