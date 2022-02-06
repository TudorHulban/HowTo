# MicroK8: Installation on Ubuntu VM
## Prerequisites
```bash
sudo apt install snapd iptables
```
## Install MicroK8
```bash
sudo snap install microk8s --classic --channel=1.18/stable
```
Join **microk8s** created group
```
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
```
Create shortcut
```
vi ~/.bash_aliases
alias kk='microk8s kubectl'
```
## Install helm
```
sudo snap install helm --classic
```
## Enable Services
```bash
sudo microk8s.enable dns dashboard registry
# check
sudo microk8s.kubectl get services
```
## Start
```bash
sudo microk8s start
# inspect
sudo microk8s inspect
sudo microk8s status
```
## Operations
### Get nodes
```bash
microk8s.kubectl get nodes
```
### Namespaces
```bash
microk8s.kubectl get namespace
microk8s.kubectl delete namespace <Namespace name>
```
### Config
```bash
microk8s.config
```
### Get pods
```
get pods --all-namespaces
```
## Sample app 1
### Install
```bash
microk8s.kubectl create deployment nginx --image=nginx
microk8s.kubectl get deployments
microk8s.kubectl get pods
```
### Delete
```bash
microk8s.kubectl get deployment 
microk8s.kubectl delete deployment <deployment to delete>
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
```bash
microk8s.kubectl apply -f filename.yml
```
## Resources
```html
https://github.com/ubuntu/microk8s
https://microk8s.io/docs/
https://github.com/ubuntu/microk8s/blob/master/docs/community.md
https://kubernetes.io/blog/2019/11/26/running-kubernetes-locally-on-linux-with-microk8s/
```
