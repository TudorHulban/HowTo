# Install (Go related)

## Protocol Buffer Compiler

```sh
apt install -y protobuf-compiler
protoc --version
```

## Go plugin for the Protocol Buffer Compiler

```sh
export GO111MODULE=on 
go get github.com/golang/protobuf/protoc-gen-go@v1.3
```

Update PATH

```sh
export PATH="$PATH:$(go env GOPATH)/bin"
```
