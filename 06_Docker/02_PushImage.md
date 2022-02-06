# Docker: Hub first steps
## 1. Create dockerfile
## 2. Login Docker Hub
Docker ID needed. 
```bash
docker login --username=DockerID
```
## 3. Build Image
```bash
docker build -t DockerID/name of repo in DockerHUB:tag in DockerHUB repo .
```
## 4. Push Image to Docker HUB
```bash
docker push DockerID/name of repo in DockerHUB:tag in DockerHUB repo
```
## 5. Retrieve Image from Docker HUB
Now image can be retrieved as needed.
```bash
FROM DockerID/name of repo in DockerHUB:tag in DockerHUB
```
#### Resources
```html
https://blog.shippable.com/build-a-docker-image-and-push-it-to-docker-hub
```
