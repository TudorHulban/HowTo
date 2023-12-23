# K8s installation using Ansible ad-hoc commands

##  Set host names

```sh
ansible 192.168.1.189 -m command -u ansible -b -a "hostnamectl set-hostname control-plane"
ansible 192.168.1.188 -m command -u ansible -b -a "hostnamectl set-hostname node-1"
ansible 192.168.1.187 -m command -u ansible -b -a "hostnamectl set-hostname node-2"
```

## Update /etc/hosts

```sh
ansible all -u ansible -b -k -K -m copy -a "src=/etc/hosts dest=/etc/hosts"
```

## Disable swap

```sh
ansible all -u ansible -b -k -K -m command -a "sed -i '10,10 s/^/#/' /etc/fstab"
```

## Reboot

```sh
ansible all -u ansible -b -k -K -m command -a "reboot now"
```

## Set containerd as container runtime

### Preparations

Connect locally as ansible, switch to bash shell:

```sh
cat << EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF
```

```sh
ansible all -u ansible -b -k -K -m command -a "modprobe overlay"
ansible all -u ansible -b -k -K -m command -a "modprobe br_netfilter"
```

again locally:

```sh
cat << EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
```

apply changes:

```sh
ansible all -u ansible -b -k -K -m command -a "sysctl --system"
```

### Install containerd

```sh
ansible all -u ansible -b -k -K -m command -a "apt update"
ansible all -u ansible -b -k -K -m command -a "apt install -y containerd"
```

#### Generate default configuration file

```sh
ansible all -u ansible -b -k -K -m command -a "mkdir -p /etc/containerd"
ansible all -u ansible -b -k -K -m command -a "containerd config default | tee /etc/containerd/config.toml"
```

#### Change SystemdCgroup to true

```sh
ansible all -u ansible -b -k -K -m command -a "sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml"
```

Restart containerd:

```sh
ansible all -u ansible -b -k -K -m command -a "systemctl restart containerd"
```

### Install dependencies

```sh
ansible all -u ansible -b -k -K -m command -a "apt update"
ansible all -u ansible -b -k -K -m command -a "apt install -y apt-transport-https ca-certificates curl gpg"
```

### Install Kubernetes

Download the public signing key for Kubernetes package repository:

```sh
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```

Add the appropriate Kubernetes apt repository:

```sh
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

Install kubeadm, kubelet and kubectl:

```sh
sudo apt update
sudo apt install -y kubeadm=1.29.0-1.1 kubelet=1.29.0-1.1 kubectl=1.29.0-1.1
sudo apt-mark hold kubeadm kubelet kubectl
```

Initialize the cluster by using kubeadm on the control plane:

```sh
sudo kubeadm init --pod-network-cidr 192.168.1.0/16 --kubernetes-version 1.29.0
```

As root:

```sh
 export KUBECONFIG=/etc/kubernetes/admin.conf
```

Install Calico network addon:

```sh
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.4/manifests/calico.yaml
```

## Resources

```html
https://iamunnip.hashnode.dev/building-a-kubernetes-v129-cluster-using-kubeadm
```