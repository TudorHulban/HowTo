# Docker: Hub first steps
## 1. Create dockerfile
## 2. Login Docker Hub
Docker ID needed. 
```sh
docker login --username=DockerID
```
## 3. Build Image
```sh
docker build -t DockerID/name of repo in DockerHUB:tag in DockerHUB repo .
```
## 4. Push Image to Docker HUB
```sh
docker push DockerID/name of repo in DockerHUB:tag in DockerHUB repo
```
## 5. Retrieve Image from Docker HUB
Now image can be retrieved as needed.
```sh
FROM DockerID/name of repo in DockerHUB:tag in DockerHUB
```
#### Resources
```html
https://blog.shippable.com/build-a-docker-image-and-push-it-to-docker-hub
```
