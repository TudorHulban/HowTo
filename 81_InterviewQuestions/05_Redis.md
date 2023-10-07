## Run LUA script with Redigo
connect:
```sh
redis-cli
```
load script to store and fetch key. script SHA is returned:
```sh
script load "return redis.call('SET', KEYS[1], ARGV[1])"
"d8f2fad9f8e86a53d2a6ebd960b33c4972cacc37"

script load "return redis.call('GET', KEYS[1])"
"d3c21d0c2b9ca22f82737626a27bcaf5d288f99f"
```
use scripts:
```sh
EVALSHA d8f2fad9f8e86a53d2a6ebd960b33c4972cacc37 1 kv-key1 kv-value1
EVALSHA d3c21d0c2b9ca22f82737626a27bcaf5d288f99f 1 kv-key1
```
### Resources
```html
https://redis.io/docs/manual/programmability/eval-intro/
https://developpaper.com/go-redigo-executes-lua-scripts-to-implement-atomic-operations/
https://stackoverflow.com/questions/41179478/calling-lua-script-from-redigo-throwing-error-wrong-number-of-args
```
## Articles
```html
https://redis.com/redis-best-practices/introduction/
```
## Videos

## Books
