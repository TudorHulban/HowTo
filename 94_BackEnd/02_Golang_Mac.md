# Golang - on Mac OS

## Environment variables

Add environment variables for z shell in '~/.zshrc'.

```sh
alias l='ls -la'

export GOPATH=$HOME/gocode
export GOROOT=/usr/local/go
export WORK=$GOPATH/src

export PATH=$PATH:/usr/local/go/bin
```

## GO download and install

From https://golang.org/dl/ .

```sh
cd /Downloads
wget https://go.dev/dl/go1.24.3.darwin-amd64.pkg
wget https://go.dev/dl/go1.24.3.darwin-arm64.pkg
```

Open Finder and install the downloaded pkg file.

## VS Code install

Open VCode.  
press CMD + SHIFT + P.  
type 'shell command'  
select 'Install code command in path'.  
navigate to any project from the terminal and type 'code .'  
