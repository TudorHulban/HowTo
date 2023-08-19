# K8s installation on Rocky Linux 9.0

Installation for Proxmox.  
ISO:

```sh
wget http://dl.rockylinux.org/vault/rocky/9.0/isos/x86_64/Rocky-9.0-x86_64-minimal.iso
```

Use Intel E1000 as network card.  
Authorized SSH keys should be present on master and nodes.

## Run
```sh
ansible-playbook 1-k8s-rocky9.0-common.yml -i hosts 
ansible-playbook 2-k8s-rocky-master.yml -i hosts 
ansible-playbook 3-k8s-rocky-node-01.yml -i hosts 
```

## Initialization

```sh
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address 192.168.1.5 --token-ttl 0 -ignore-preflight-errors=NumCPU --ignore-preflight-errors=Mem
```

Create k8s configuration:

```sh
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
```


## Resources

```html
https://www.howtoforge.com/how-to-setup-kubernetes-cluster-with-kubeadm-on-rocky-linux/
https://idroot.us/install-kubernetes-rocky-linux-9/
https://www.centlinux.com/2022/11/install-kubernetes-master-node-rocky-linux.html
```
