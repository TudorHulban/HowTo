## Create container
```sh
docker run --name redis-test -p 6379:6379  -d redis 
```
## Debugging
a. attach to redis container ID:
```sh
docker exec -i -t containerID /bin/bash
```
b. use redis cli to run the needed command, ex.:
```sh
redis-cli KEYS *
```
## Resources
```
https://www.openmymind.net/redis.pdf
https://www.alexedwards.net/blog/working-with-redis
https://stackoverflow.com/questions/51801744/gomodule-redigo-how-can-i-push-multiple-keys-to-redis
