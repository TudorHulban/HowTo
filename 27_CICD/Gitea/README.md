# DevOps with Gitea

Concentrating Devops knowledge with Gitea CI / CD.

## Default theme customization

Concentrate CSS style in `styles.css` file. Place this file in `custom/public` folder. If using Docker volume place the file in `data/custom/public` (given volume root in data).  
Create `header.tmpl` as below and place it in `custom/templates/custom/header.tmpl`.

```html
<link rel="stylesheet" href="{{AppSubUrl}}/styles.css">
```

## Resources

```html
https://itnext.io/explore-gitea-drone-ci-cd-on-k3s-4a9e99f8b938
https://dev.to/ruanbekker/self-hosted-cicd-with-gitea-and-drone-ci-200l
https://docs.gitea.io/en-us/customizing-gitea/#example-plantuml
```
