# MicroK8 - Ubuntu VM installation

## Prerequisites

```sh
sudo apt install snapd iptables
```

## Install MicroK8

```sh
sudo snap install microk8s --classic --channel=1.18/stable
```

Join **microk8s** created group

```sh
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
```

Create shortcut

```sh
vi ~/.bash_aliases
alias kctl='microk8s kubectl'
```

Create configuration

```sh
microk8s kubectl config view --raw > ~/.kube/config
```

## Dashboard

Enable proxy:
```sh
microk8s kubectl proxy
```

URL:

```html
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```

## Install helm

```sh
sudo snap install helm --classic
```

## Enable Services

```sh
sudo microk8s.enable dns dashboard registry
# check
sudo microk8s.kubectl get services
```

## Start

```sh
sudo microk8s start
# inspect
sudo microk8s inspect
sudo microk8s status
```

## Operations

### Get nodes

```sh
microk8s.kubectl get nodes
```

### Namespaces

```sh
microk8s.kubectl get namespace
microk8s.kubectl delete namespace <Namespace name>
```

### Config

```sh
microk8s.config
```

### Get pods

```sh
get pods --all-namespaces
```

### Get all objects

```sh
microk8s kubectl get all --all-namespaces
```

## Sample app 1

### Install

```sh
microk8s.kubectl create deployment nginx --image=nginx
microk8s.kubectl get deployments
microk8s.kubectl get pods
```

### Delete

```sh
microk8s.kubectl get deployment 
microk8s.kubectl delete deployment <deployment to delete>
```

Delete all:

```sh
microk8s kubectl delete all --all --all-namespaces
```

## Sample app 2

### Configuration

Save to filename.yml.

```yaml
apiVersion: apps/v1    
kind: Deployment    
metadata:    
  name: nginx-deployment    
  labels:    
    app: nginx    
spec:    
  replicas: 3    
  selector:    
    matchLabels:    
      app: nginx    
  template:    
    metadata:    
      labels:    
        app: nginx    
    spec:    
      containers:    
      - name: nginx    
        image: nginx    
        ports:    
        - containerPort: 80
```

### Use

```sh
microk8s.kubectl apply -f filename.yml
```

## Resources

```html
https://github.com/ubuntu/microk8s
https://microk8s.io/docs/
https://github.com/ubuntu/microk8s/blob/master/docs/community.md
https://kubernetes.io/blog/2019/11/26/running-kubernetes-locally-on-linux-with-microk8s/
```
