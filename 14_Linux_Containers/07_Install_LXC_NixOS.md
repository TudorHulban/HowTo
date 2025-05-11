# Linux Containers NixOS LXC support

## LXC install

Add to configuration:

```sh

```

### Check templates are downloaded

```sh
# will return value abcd
nix-store -q --references $(which lxc-create) | grep lxc

# use value returned as
ls abcd/share/lxc/templates
# should return
lxc-busybox  lxc-download  lxc-local  lxc-oci
```

### Check templates are available

```sh
sudo lxc-create -n test -t download -- --list
```

### Add templates locaton to configuration

Use returned value from above:

```sh
environment.etc."lxc/lxc.conf".text = ''
    lxc.template.dir = abcd/share/lxc/templates
  '';

# rebuild  
sudo nixos-rebuild switch
```

## Create container

```sh
sudo lxc-create -n c1 -t download -- --dist alpine --release 3.21 --arch amd64 && \
sudo zfs create rpool/lxc/alpine-container && \
echo "lxc.rootfs.path = zfs:rpool/lxc/alpine-container" | sudo tee -a /var/lib/lxc/c1/config
```

Verify creation:

```sh
sudo lxc-ls -f
```

And configuration:

```sh
sudo cat /var/lib/lxc/c1/config
```

## Start container

```sh
sudo lxc-start -n c1 --logfile=/tmp/c1.log --logpriority=DEBUG
sudo cat /tmp/c1.log
```
