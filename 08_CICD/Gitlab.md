## Gitlab Installation
### Debian 10.7
Install locales for PostgreSQL
```bash
sudo apt-get install locales-all
```
Set language variables
```bash
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
```
Update system and then run with sudo as per:
```html
https://about.gitlab.com/install/#debian
```

#### Install Gitlab Runner
Add the official GitLab repository
```
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
```
Install the latest version of GitLab Runner
```
export GITLAB_RUNNER_DISABLE_SKEL=true; sudo -E apt-get install gitlab-runner
```
Register runner<br/>
Instructions can be found in project - CI / CD - runners - show runner installation instructions, consider also:
```
sudo gitlab-runner register --url http://192.168.1.35/ --registration-token g7-xfhXAjz77ooikfBLV
```
You might want to consider disabling other runners for the project.

##### Resources
```
https://www.youtube.com/watch?v=G8ZONHOTAQk
https://docs.gitlab.com/runner/install/linux-repository.html#installing-gitlab-runner
```

### Operations
#### Apply changes
```
sudo gitlab-ctl reconfigure
```
### Restart
```
sudo service gitlab restart
```
#### Reset root password
Takes some time to process.
```bash
sudo gitlab-rake "gitlab:password:reset[root]"
```
