# GO: Installation and First Steps

## Environment variables

Add environment variables for z shell in.

```bash
alias l='ls -la'

export GOPATH=$HOME/gocode
export GOROOT=/usr/local/go
export WORK=$GOPATH/src/olx

export PATH=$PATH:/usr/local/go/bin
```

## GO download and install

From https://golang.org/dl/ .

```bash
cd /Downloads
wget https://go.dev/dl/go1.17.4.darwin-amd64.pkg
```

Open Finder and install the downloaded pkg file.

## VS Code install

Open VCode.  
press CMD + SHIFT + P.  
type 'shell command'  
select 'Install code command in path'.  
navigate to any project from the terminal and type 'code .'  
