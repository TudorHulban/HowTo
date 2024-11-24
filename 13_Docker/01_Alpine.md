# Docker: Alpine and first steps <a name="top"></a>

## Installation

```sh
vi /etc/apk/repositories  # uncomment community repo
apk update
rc-update add docker boot # adds docker daemon when booting
service docker start      # start docker service
```

## Create container of Alpine latest 

```sh
docker pull alpine
docker run -it --rm alpine # /bin/ash, defaults to sh
# -i , interactive mode
# -t , alocate pseudo TTY
# --rm , remove container after stop
```

## Detaching from container 

Ctrl-P Ctrl-Q or `exit`.

## Docker image creation

```sh
# pulls image, creates container
docker run --name P1 -d -p 5432:5432 -e POSTGRES_PASSWORD=pp postgres:alpine
docker exec <container ID> cat /etc/os-release  # gets OS version as Alpine
psql -h localhost -p 5432 -U postgres  # connects to DB
```
