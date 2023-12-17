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

## Resources

```html
https://iamunnip.hashnode.dev/building-a-kubernetes-v129-cluster-using-kubeadm
```