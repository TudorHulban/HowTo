# PostgreSQL: Installation in Alma Linux

## Installation

Add the PostgreSQL repository for RHEL 9:

```sh
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
```

### Install version 17

```sh
sudo dnf install postgresql17 postgresql17-server postgresql17-contrib
```

### Initialize PostgreSQL data and configurations

```sh
sudo /usr/pgsql-17/bin/postgresql-17-setup initdb
```

### Start and enable the PostgreSQL 15 service

```sh
sudo systemctl start postgresql-17
sudo systemctl enable postgresql-17
```

Verify the PostgreSQL service:

```sh
sudo systemctl status postgresql-17
```

## Configuration

### Change the password for the default PostgreSQL user 'postgres'

```sh
sudo -u postgres psql
```

```sql
ALTER ROLE postgres WITH PASSWORD 'password';
quit
```

Verify:

```sh
sudo -u postgres psql -h localhost -U postgres
```  
