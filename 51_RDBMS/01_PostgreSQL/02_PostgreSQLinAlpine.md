# PostgreSQL: Installation in Alpine

## Installation

As root:

```sh
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

```sh
# postgresql.conf, add listen_addresses = '*'
# pg_hba.conf, add host    all             all             192.168.1.0/24          password
```

Add service to current rc level:

```sh
rc-update add postgresql
# to verify configurations
reboot
```

Stop service:

```sh
rc-service postgresql stop
```

### Example File storage

```sql
create table if not exists test(id int, uploadedfile bytea);
```
