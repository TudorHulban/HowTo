# Gitlab Installation

Have the Community Edition installed.

## Java Installation

Needed for plugins, ex. kroki.

```sh
sudo apt install default-jdk
```

## Debian 10.7

### Prerequisites

```sh
sudo apt install curl
```

Install locales for PostgreSQL

```sh
sudo apt-get install locales-all
```

Set language variables

```sh
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
```

Update system and then run with sudo as per:

```html
https://about.gitlab.com/install/#debian
```

or

```sh
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo EXTERNAL_URL="http://192.168.1.91" apt-get install gitlab-ce
```

## Login

URL:

```html
http://install-IP/users/sign_in
```

Credentials:

```sh
user: root
password: as per /etc/gitlab/initial_root_password
```

## Troubleshooting

```sh
# status
sudo gitlab-ctl status
# restart
sudo gitlab-ctl restart
# stop
sudo gitlab-ctl stop
```

## Kroki integration

Renders without problems on Firefox only as per https://github.com/yuzutech/kroki/issues/809.  
Enable in Gitlab as per https://docs.gitlab.com/ee/administration/integration/kroki.html.  
Download from https://github.com/yuzutech/kroki/releases.  

Run with:

```sh
java -jar kroki-server.jar
```

Port to listen is 8000.

## Install Gitlab Runner

Add the official GitLab repository

```sh
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
```

Install the latest version of GitLab Runner

```sh
export GITLAB_RUNNER_DISABLE_SKEL=true; sudo -E apt-get install gitlab-runner
```

Register runner  
Instructions can be found in project - CI / CD - runners - show runner installation instructions, consider also:

```sh
sudo gitlab-runner register --url http://192.168.1.35/ --registration-token g7-xfhXAjz77ooikfBLV
```

You might want to consider disabling other runners for the project.

## Operations

### Apply changes

```sh
sudo gitlab-ctl reconfigure
```

#### Reset root password

Takes some time to process.

```sh
sudo gitlab-rake "gitlab:password:reset[root]"
```

## Resources

```html
https://www.youtube.com/watch?v=G8ZONHOTAQk
https://docs.gitlab.com/runner/install/linux-repository.html#installing-gitlab-runner
```
