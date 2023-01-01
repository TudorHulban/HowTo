# CI Files

## Prerequisites

Go file and modules (`go..mod`) present.

## .drone.yml

```yaml
kind: pipeline
name: testci
type: docker
steps:
  - name: all-in-one
    image: golang:1.16
    commands:
      - pwd
      - ls
      - make setup-tools
      - make format
#      - make lint
#      - make test-coverage
      - go run main.go
```

## Makefile

```makefile
GO := go

.PHONY: setup-tools
setup-tools: ## Setup. Installs linter aggregator.
	$(GO) install golang.org/x/tools/cmd/goimports@latest
	$(GO) install github.com/securego/gosec/cmd/gosec@latest
	@curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.39.0


.PHONY: format
format: ## Formats the source code
	@echo "Formatting code and imports."
	$(GO)fmt -s -w .
	$(GO)imports -w .


.PHONY: lint
lint: ## Invokes the linter aggregator. Check golangci.yml got the checks.
	@echo "Linting with golangci lint aggregator."
	@golangci-lint run --timeout 5m 

.PHONY: test-coverage
test-coverage: ## Executes all unit tests, provides coverage.
	$(GO) test -race ./... -cover
```

## .golangci.yml

```yaml
run:
  issues-exit-code: 1
  tests: true
  skip-dirs-use-default: true
output:
  format: colored-line-number
  print-issued-lines: true
  print-linter-name: true
linters:
  enable:
    - deadcode
    - dogsled
    - errcheck
    - funlen
    - goconst
    - gocyclo
    - gofmt
    - goimports
    - golint
    - gosec
    - gosimple
    - govet
    - ineffassign
    - interfacer
    - lll
    - maligned
    - misspell
    - staticcheck
    - structcheck
    - stylecheck
    - typecheck
    - unconvert
    - unparam
    - unused
    - varcheck
    - whitespace
linters-settings:
  lll:
    line-length: 5
  maligned:
    suggest-new: true
  gocyclo:
    min-complexity: 10
  funlen:
    lines: 77
    statements: 50
```
