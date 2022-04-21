# GO: Installation and First Steps
## Environment variables
Add environment variables for default bash shell in.
```bash
vi $HOME/.bashrc
# export GO111MODULE=on - not needed with 1.16+
export PATH=$PATH:/usr/local/go/bin # for test system: export PATH=$PATH:$HOME/go/bin
# if not working try $HOME/.profile
```
## GO download and install
From https://golang.org/dl/ .
```bash
wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz
# for test system local install: tar -xzf go1.18.linux-amd64.tar.gz
```
Verify:
```bash
go version
```
For gotest to work enable execution on /tmp:
```bash
sudo vi /etc/fstab
```
Remove noexec from tmp. Save and remount tmp.
```bash
sudo mount -o remount /tmp
```
Verify:
```bash
mount |grep /tmp
```
### Download IDE
```sh
wget https://github.com/visualfc/liteide/releases/download/x37.4/liteidex37.4.linux64-qt5.5.1.tar.gz
```
## Upgrade GO version
### Remove previous version first.
```bash
sudo rm -r /usr/local/go
```
### Download and unzip new version.
```bash
tar -C $HOME -xzf <new version>
```
### Godoc
See 
```html
https://blog.golang.org/godoc-documenting-go-code
```
```bash
go get golang.org/x/tools/cmd/godoc  
# installs godoc in $HOME/go/bin, modify PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
# package to browse needs to be in $HOME/go/src/package name
godoc -http=:6060
# Navigate to http://localhost:6060/pkg/package name/?m=all  # will present also data of unexported 
```
### Resources
```html
https://github.com/golang/go/wiki/Modules
https://www.youtube.com/watch?v=F8nrpe0XWRg&list=PLq2Nv-Sh8EbbIjQgDzapOFeVfv5bGOoPE&index=3&t=0s
https://dev.to/maelvls/why-is-go111module-everywhere-and-everything-about-go-modules-24k
https://dave.cheney.net/2018/07/14/taking-go-modules-for-a-spin
https://dave.cheney.net/2018/07/16/using-go-modules-with-travis-ci
```
