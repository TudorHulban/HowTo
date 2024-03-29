# K8s installation on Ubuntu 22.04.3 LTS

Installation for Proxmox.  
ISO:

```sh
wget http://mirrors.m247.ro/ubuntu-releases/22.04.3/ubuntu-22.04.3-live-server-amd64.iso
```

Use Intel E1000 as network card.  
Authorized SSH keys should be present on master and nodes.

## Run
```sh
ansible-playbook 1-k8s-ubuntu-common.yml -i hosts 
ansible-playbook 2-k8s-ubuntu-master.yml -i hosts 
ansible-playbook 3-k8s-ubuntu-node-01.yml -i hosts 
ansible-playbook 4-k8s-ubuntu-node-02.yml -i hosts 
```

## Hosts
See [hosts](hosts).

## Common

See [common](1-k8s-ubuntu-common.yml).

## Master

See [master node](2-k8s-ubuntu-master.yml).

## Nodes

See [worker node 1](3-k8s-ubuntu-node-01.yml) and [worker node 2](4-k8s-ubuntu-node-02.yml).

## Initialization

On master node (needs reboot):

```sh
kubeadm init --pod-network-cidr 10.10.0.0/16 --kubernetes-version 1.26.8 --node-name k8s-master
```

Create k8s configuration:

```sh
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
```

or as root:

```sh
  export KUBECONFIG=/etc/kubernetes/admin.conf
```

### Install pod network (Flannel)

Download configuration:

```sh
wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

Apply it:

```sh
kubectl apply -f kube-flannel.yml
```

Verify:

```sh
kubectl get pod -n kube-system
# or
kubectl get pods --all-namespaces
```

## Add nodes

Reboot node prior to joining the cluster. Execute on master:

```sh
kubeadm token create --print-join-command
```

## Stop cluster

```sh
kubectl drain master-node
# or 
kubectl drain master-node --ignore-daemonsets --force
```

## Troubleshoot

```sh
df -h /
tail  /var/log/messages
```

### Sockets  

```sh
 ncat -k -l 4444 |bash
```

## Resources
```html
https://buildvirtual.net/deploy-a-kubernetes-cluster-using-ansible/
```
