## Install

```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```
## Chart LifeCycle
### Create Chart
```
helm create tchart
# inspect
tree tchart
```

```
tchart/    
├── charts    
├── Chart.yaml    
├── templates    
│   ├── deployment.yaml    
│   ├── _helpers.tpl    
│   ├── hpa.yaml    
│   ├── ingress.yaml    
│   ├── NOTES.txt    
│   ├── serviceaccount.yaml    
│   ├── service.yaml    
│   └── tests    
│       └── test-connection.yaml    
└── values.yaml    
```

### Reset 
Delete all template files or all files.

```
rm -v  tchart/templates/* # or
rm -rf templates/tests/ && rm templates/*.yaml && rm templates//NOTES.txt 
```

Create Chart.yaml
```
apiVersion: v1    
name: tnginx    
version: 0.1.0    
appVersion: 1.0    
    
description: nginx test    
```
Test
```sh
helm template tchart tchart
```
### List deployments
```sh
helm list
```

### Delete deployments
```sh
helm delete my-release
```
## Resources
```
https://docs.bitnami.com/tutorials/series/best-practices-helm/
https://www.youtube.com/playlist?list=PLSwo-wAGP1b8svO5fbAr7ko2Buz6GuH1g
https://helm.sh/docs/intro/install/
https://semver.org/spec/v2.0.0.html
https://helm.sh/docs/chart_template_guide/
```
