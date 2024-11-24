# Example Dockerfile for TwoBirds JS

```sh
FROM electronuserland/builder:latest

# verifications
RUN cat /etc/*release \
	&& node -v \
	&& npm -v \
	&& git --version

RUN git clone https://gitlab.com/twoBirds/twobirds-core.git
WORKDIR twobirds-core

RUN npm install -g grunt grunt-cli \
	&& grunt -version \
	&& npm install \
	&& grunt

WORKDIR dist/tb
RUN ls -1 | awk -vpath=$PWD/ '{print path$1}'
```
