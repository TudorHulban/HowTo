# K8s installation on Rocky Linux 9.0

Installation for Proxmox.  
ISO:

```sh
wget http://dl.rockylinux.org/vault/rocky/9.0/isos/x86_64/Rocky-9.0-x86_64-minimal.iso
```

Use Intel E1000 as network card.  
Authorized SSH keys should be present on master and nodes.

## Hosts
On Rocky 9.0 switch remote user to `rocky`.