# Golang - on Linux

## Prerequisites

```sh
 sudo apt install build-essential

 go install golang.org/x/tools/gopls@latest
```

### For Linux Mint 21.3

If any issues, try:

```sh
sudo apt install --reinstall build-essential
```

### Environment variables

Add environment variables for default bash shell in.

```sh
vi $HOME/.bashrc
export GOTMPDIR=/mnt/tmpfs.ramdisk
export GOCACHE=/mnt/tmpfs.ramdisk/gocache # check size du -hs $(go env GOCACHE)
export PATH=$PATH:/usr/local/go/bin:~/go/bin # for test system: export PATH=$PATH:$HOME/go/bin
# if not working try $HOME/.profile
```

## GO download and install

From https://golang.org/dl/ .

```sh
wget -O go-amd64.tar.gz https://go.dev/dl/go1.23.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go-amd64.tar.gz
# for test system local install: tar -xzf go-amd64.tar.gz
```

Verify:

```sh
go version
```

For gotest to work enable execution on /tmp:

```sh
sudo vi /etc/fstab
```

Remove noexec from tmp. Save and remount tmp.

```sh
sudo mount -o remount /tmp
```

Verify:

```sh
mount |grep /tmp
```

## TParse

```sh
go install github.com/mfridman/tparse@latest
```

## LiteIDE

```sh
wget https://github.com/visualfc/liteide/releases/download/x37.4/liteidex37.4.linux64-qt5.5.1.tar.gz
```

## Upgrade GO version

### Remove previous version first

```sh
sudo rm -r /usr/local/go
```

### Download and unzip new version

```sh
tar -C $HOME -xzf <new version>
```

## Golangci linter

```sh
# if any issues temporary add to bashrc
export GO111MODULE=off
# binary will be $(go env GOPATH)/bin/golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.59.1

golangci-lint --version
```

## Godoc

See:  

```html
https://blog.golang.org/godoc-documenting-go-code
```

```sh
go get golang.org/x/tools/cmd/godoc  
# installs godoc in $HOME/go/bin, modify PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
# package to browse needs to be in $HOME/go/src/package name
godoc -http=:6060
# Navigate to http://localhost:6060/pkg/package name/?m=all  # will present also data of unexported 

```

## Script for creating test folder

```sh
#!/bin/bash
output_folder="test"
output_file="main.go"

mkdir ${output_folder}
cd ${output_folder}

touch ${output_file}
echo "package main" > ${output_file}
echo "" >> ${output_file}
echo "func main() {}" >> ${output_file}

go mod init test 
```

## Script for creating monorepo structure

```sh
#!/bin/bash
#  helpers
function createDoc () {
touch $2
echo $1 > $2
}

# folders
output_top_folder="test"
output_cmd="cmd"
output_domain="domain"
output_services="services"
output_infra="infra"

# files
output_file="main.go"
generic_doc="doc.go"
makefile="Makefile"

# create folder cmd
mkdir ${output_top_folder}
cd ${output_top_folder}
mkdir ${output_cmd}
cd ${output_cmd}

touch ${output_file}
echo "package main" > ${output_file}
echo "" >> ${output_file}
echo "func main() {}" >> ${output_file}

cd ..

# create folder domain
mkdir ${output_domain}
cd ${output_domain}

createDoc "package domain" ${generic_doc}

cd ..

# create folder services
mkdir ${output_services}
cd ${output_services}

createDoc "package services" ${generic_doc}

cd ..

# create folder infra
mkdir ${output_infra}
cd ${output_infra}

createDoc "package infra" ${generic_doc}

cd ..

touch ${makefile}
echo "test-tparse:" > ${makefile}
printf '\t%s' "@go test -failfast -count=1 -p 1 ./... -cover -race -json | tparse -smallscreen" >> ${makefile}

go mod init test 
```

## Resources

```html
https://github.com/golang/go/wiki/Modules
https://www.youtube.com/watch?v=F8nrpe0XWRg&list=PLq2Nv-Sh8EbbIjQgDzapOFeVfv5bGOoPE&index=3&t=0s
https://dev.to/maelvls/why-is-go111module-everywhere-and-everything-about-go-modules-24k
https://dave.cheney.net/2018/07/14/taking-go-modules-for-a-spin
https://dave.cheney.net/2018/07/16/using-go-modules-with-travis-ci
```
