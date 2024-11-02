# SQLite : Install and first steps

## Install

```sh
sudo apt-get install sqlite3 libsqlite3-dev
```

## Browser

Install:

```sh
sudo apt install sqlitebrowser
```

see:

```html
http://sqlitebrowser.org
```

## Use (Go)

```go
package main

    import (
        "database/sql"
        _ "github.com/mattn/go-sqlite3"
    )
  ```  

## Create Table

```sql
DROP TABLE people;
 
CREATE TABLE people (
 person_id INTEGER PRIMARY KEY,
 first_name text NOT NULL,
 last_name text NOT NULL
);
```
