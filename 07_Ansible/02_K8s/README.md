# K8s installation on Rocky Linux 8.4

Installation for Proxmox.  
ISO:

```sh
wget http://dl.rockylinux.org/vault/rocky/8.4/isos/x86_64/Rocky-8.4-x86_64-minimal.iso
```

Use Intel E1000 as network card.  
Authorized SSH keys should be present on master and nodes.

## Hosts

See [hosts](hosts).

## Common

See [common](1-k8s-rocky-common.yml).

## Master

See [master node](2-k8s-rocky-master.yml).

## Nodes

See [worker node 1](3-k8s-rocky-node-01.yml) and [worker node 2](4-k8s-rocky-node-02.yml).

## Initialization

```sh
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address 192.168.1.137 --token-ttl 0
```

Create k8s configuration:

```sh
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
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

Execute on master:

```sh
kubeadm token create --print-join-command
```

## Stop cluster

```sh
kubectl drain master-node
# or 
kubectl drain master-node --ignore-daemonsets --force
```

```html
https://www.suse.com/support/kb/doc/?id=000020031
https://www.cyberithub.com/unable-to-drain-out-kubernetes-cluster-node-for-maintenance/
```

## Troubleshoot

```sh
df -h /
tail  /var/log/messages
```

## Resources

```html
https://www.programmersought.com/article/92159771798/
https://ronanquillevere.github.io/2017/05/16/kubernetes-ovh.html#.Y6h20NJByV5
https://upcloud.com/resources/tutorials/install-kubernetes-cluster-centos-8
https://yourdevopsmentor.com/blog/how-to-stop-all-kubernetes-deployments/
```
