## Start Test
```sh
for i in $(seq $(getconf _NPROCESSORS_ONLN)); do yes > /dev/null & done
```

## Kill Test
```sh
killall yes
```

## Resources
```html
https://linuxconfig.org/how-to-stress-test-your-cpu-on-linux
```
