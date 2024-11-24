# K8s - Ingress Controller

Using Helm add HAProxy repo:

```sh
helm repo add haproxytech https://haproxytech.github.io/helm-charts
helm repo update
```

Create kubernetes configuration:

```sh
[microk8s] kubectl config view --raw > ~/.kube/config
```

Search and install charts:

```sh
helm search repo haproxytech/
helm install my-release haproxytech/<chart>
```

Verify:

```sh
kubectl get all
```

## Resources

```html
https://semaphoreci.com/blog/kubernetes-ingress?utm_source=Blog+Newsletter&utm_campaign=2a4817d90d-Jun_8_2023&utm_medium=email&utm_term=0_2c1357b8be-2a4817d90d-115994679
https://thenewstack.io/kubernetes-ingress-for-beginners/
https://devopscube.com/setup-ingress-kubernetes-nginx-controller/
```
