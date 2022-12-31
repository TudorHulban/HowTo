Example Dockerfile exposing port for SSH server.

```bash
# see https://docs.docker.com/engine/examples/running_ssh_service/#build-an-eg_sshd-image
FROM ubuntu:18.04

RUN apt-get update \
	&& apt-get install -y openssh-server \
	&& mkdir /var/run/sshd \
	&& echo 'root:thepassword' | chpasswd \
	&& sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
	&& sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
	# SSH login fix. Otherwise user is kicked off after login

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
```
