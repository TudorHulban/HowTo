# Docker: Debian 10 Installation and first steps<a name="top"></a>
* [Prerequisites](#prere) 
* [Install - GPG Key](#key) 
* [Install - Docker Repo](#repo) 
* [Install - Docker](#idocker) 
* [Configuration](#config)
* [Getting Started](#start) 
* [Dockerfile](#file)
* [Docker Image](#image) 
* [Docker Containers](#cont) 
* [Troubleshooting](#tshoot) 
* [Ubuntu Install](#ubuntu) 

## Prerequisites <a name="prere"></a> 
* 64b OS
* RAM disk (lower SSD wear)
* Dependencies install. Not necessary on MX Linux.
```bash
sudo apt update
sudo apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
```
* Resources:
```html
https://computingforgeeks.com/install-docker-and-docker-compose-on-debian-10-buster/
https://docs.docker.com/install/linux/docker-ce/ubuntu/
https://flaviocopes.com/golang-docker/
http://containertutorials.com/index.html
https://medium.com/@betz.mark/ten-tips-for-debugging-docker-containers-cde4da841a1d
https://medium.com/@chemidy/create-the-smallest-and-secured-golang-docker-image-based-on-scratch-4752223b7324
https://www.how2shout.com/how-to/how-to-install-docker-ce-on-mx-linux.html
https://towardsdatascience.com/key-kubernetes-commands-741fe61fde8
https://codebeautify.org/yaml-validator/
```
## Install - Add GPG Key <a name="key"></a> ([Up](#top))
```bash
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
```
## Install - Add Docker Repo <a name="repo"></a> ([Up](#top))
```bash
sudo vi /etc/apt/sources.list
# add at end of file: deb [arch=amd64] https://download.docker.com/linux/debian buster stable
sudo apt update
```
On MX Linux the file to update:
```bash
cd /etc/apt/sources.list.d/
sudo vi mx.list
```
On Ubuntu 20.04 LTS
```
https://allthings.how/how-to-install-docker-on-ubuntu-20-04-lts/
```
## Install - Docker <a name="idocker"></a> ([Up](#top))
### Install Docker Community Edition:
```bash
sudo apt -y install docker-ce
```
### Install Docker Compose
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```
## Configuration <a name="config"></a> ([Up](#top))
In default configuration images are stored for Debian in `/var/lib/docker/`. Information about the configuration:
```
docker info
```
### Make current user not use sudo
Change will take place after full logout / log off.
```bash
sudo usermod -aG docker $USER  # $USER is environment variable holding current user
 ```
### Move data folder to RAM disk
Check existing RAM disks (ex. https://github.com/TudorHulban/HowTo/tree/main/01_OSs#ram).<br/>
Set Docker data folder location by editing /etc/docker/daemon.json:
```json
{
    "data-root": "/mnt/tmpfs.ramdisk/Docker",
    "storage-driver": "overlay2"
}
```
Reload cnfiguration:
```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```
## Getting Started <a name="start"></a> ([Up](#top))
### Start Docker
```bash
# check first
systemctl show --property ActiveState docker
sudo dockerd &
```
## Dockerfile <a name="file"></a> ([Up](#top))
### Create docker file
The implicit dockerfile name is Dockerfile.
#### For HTTP testing
```bash
vi Dockerfile
# ex.
# FROM basex/basexhttp:9.1
```
#### For general testing
```
FROM bitnami/minideb:latest
CMD ["cat", "/etc/os-release"]
```
## Docker Image <a name="image"></a> ([Up](#top))
### Create docker image based on a Docker file
```bash
sudo docker build -t imagename .
```
#### Check newly created image:
```bash
docker images -a
docker history <img ID>
```
#### Inspect image
```
docker image inspect imagename
```
#### Delete image (untagged):
```bash
docker images -q |xargs docker rmi -f
# or
docker rmi <img ID>
```
## Docker Containers <a name="cont"></a> ([Up](#top))
### Create container based on image
#### Create network using macvlan driver to connect from other host
```bash
docker network create -d macvlan --subnet=192.168.1.0/24 --ip-range=192.168.1.128/25 --gateway=192.168.1.127 -o parent=enp4s0 macnet
# list networks
docker network ls
# inspect network
docker network inspect <network name>
```
#### Create container
```bash
sudo docker run -d -p 5432:5432 --name container_name -it {image ID}
# -i , interactive mode
# -t , alocate pseudo TTY
# or
sudo docker run -d -p 5432:5432 --name container_name --network <network name> -it {image ID}
# check
sudo docker ps -a
```
### Container Operations
#### List containers
```bash
docker ps -a
docker ps --format "table {{.ID}}\t{{.Status}}\t{{.Names}}"
```
#### Start container
```bash
docker start <container ID>
# get logs
docker logs <container ID>
```
#### Check container logs
```sh
docker container logs <container ID>
```
#### Stop container
```bash
docker stop <container ID>
```
#### Get container IP
```bash
docker inspect <container ID> | grep IPAddress
```
#### Remove container
```bash
docker rm <container ID>  # -f (force) if container is active
```
#### Execute command in container
```bash
docker exec -it <container name> <command, ex. bash>
```
#### Get container IP
```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'  container_name_or_id
```
#### Attach to a container 
Detach with ctrl + D. Container will stop at detach:
```bash
docker attach <container ID>
```
#### Clean Up
##### Delete all containers
```bash
docker rm -f `docker ps --no-trunc -aq`
```
##### Delete Volumes
```sh
docker volume ls
docker volume rm volume_name volume_name
docker volume prune
```
##### Delete container and volume
```sh
docker rm -v container_name
```

Notes:
- -d , Run container in background and print container ID
- -p , Publish a container’s port(s) to the host
- -t , Allocate a pseudo-TTY
- -i , Keep STDIN open even if not attached 
- https://docs.docker.com/engine/installation/linux/docker-ce/binaries/#prerequisites
- add current user to docker group to run without sudo. logout and login to take effect:
```bash
sudo usermod -aG docker <user_to_add>
```
#### Port exposing
The EXPOSE instruction does not actually publish the port. 
It functions as a type of documentation between the person who builds the image and the person who runs the container,
about which ports are intended to be published. 
To actually publish the port when running the container, use the -p flag on docker run to publish and map one or more 
ports, or the -P flag to publish all exposed ports and map them to high-order ports.<br/>
See: https://docs.docker.com/engine/examples/running_ssh_service/ .

## Troubleshooting <a name="tshoot"></a> ([Up](#top))
Resource consumption:
```shell
docker ps -q | xargs  docker stats --no-stream
```
Masked docker service:<br/>
Unmask 
```bash
systemctl unmask docker.service
systemctl unmask docker.socket
systemctl start docker.service
# now the service should appear enabled
systemctl list-unit-files | grep docker
```
## Ubuntu Install <a name="ubuntu"></a> ([Up](#top))
```html
https://docs.docker.com/engine/install/ubuntu/
```

## Resources
```
https://github.com/gvilarino/docker-workshop
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04
```
