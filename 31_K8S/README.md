# K8s: Installation and first steps
## Install K8s in LXC
```
https://github.com/corneliusweig/kubernetes-lxd
```
### MiniKube
```html
https://linuxhint.com/install-minikube-ubuntu/
```

## Resources
### Cheat Sheet
```html
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
https://kubernetes.io/docs/reference/kubectl/cheatsheet/
```
### Example of Kubernetes deployment manifest file
```
apiVersion: apps/v1beta1
kind: Deployment # it is a deployment
metadata:
  name: endpoints # name of the Deployment
  labels:
    # any Pods with matching labels are included in this Deployment
    app: kubernetes-series
    tier: endpoints
spec:
  # ReplicaSet specification
  replicas: 3 # we are making 3 Pods
  selector:
    matchLabels:
      # ReplicaSet labels will match Pods with the following labels
      tier: endpoints
  template:
    # Pod template
    metadata:
      labels:
        # Pod's labels
        app: kubernetes-series
        tier: endpoints
    spec:
      # Pod specification
      containers:
        # the container(s) in this Pod
        - name: partone-container
          image: gcr.io/PROJECT_NAME/partone-container:latest
          # environment variables for the Pod
          env:
            - name: GCLOUD_PROJECT
              value: PROJECT_NAME
            # we are going to use this later
            # for now it creates a custom endpoint
            # for this pod
            - name: POD_ENDPOINT
              value: endpoint
            - name: NODE_ENV
              value: production
          ports:
            - containerPort: 80
```
### Others
```html
https://www.tutorialspoint.com/kubernetes/index.htm
https://www.sayem.org/k8s-on-lxd/
https://www.techrepublic.com/article/how-to-quickly-install-kubernetes-on-ubuntu/
https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
https://github.com/kelseyhightower/kubernetes-the-hard-way
https://helm.workshop.flagger.dev/
https://helm.sh/docs/chart_best_practices/templates/
https://medium.com/google-cloud/kubernetes-routing-internal-services-through-fqdn-d98db92b79d3
https://www.programmersought.com/article/92159771798/
https://www.natarajmb.com/2022/06/kubernetes-debian/
https://github.com/intel/cri-resource-manager/issues/655
https://www.linode.com/docs/guides/build-a-cd-pipeline-with-lke/
```


