# Performance Testing

## Stress Test

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

## Speed test

```sh
sudo dnf install fio -y
```

```sh
# sequential write
fio --name=seq_write --ioengine=libaio --rw=write --bs=1M --size=1G --numjobs=1 --iodepth=32 --direct=1
# sequential read
fio --name=seq_read --ioengine=libaio --rw=read --bs=1M --size=1G --numjobs=1 --iodepth=32 --direct=1
# random write
fio --name=rand_write --ioengine=libaio --rw=randwrite --bs=4K --size=1G --numjobs=1 --iodepth=64 --direct=1
# random read
fio --name=rand_read --ioengine=libaio --rw=randread --bs=4K --size=1G --numjobs=1 --iodepth=64 --direct=1
```
