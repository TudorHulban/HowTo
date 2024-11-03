# Terraform with Alma Linux

## Installation

### Add Dependencies

```sh
sudo dnf install dnf-plugins-core -y
```

### Add repository

```sh
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
```

### Install

```sh
sudo dnf install terraform -y
```

### Verify

```sh
terraform --version
```
