# Generate openssl SSH key

## Install OpenSSL

```sh
sudo dnf install openssl openssl-devel -y
```

Verify:

```sh
openssl version
```

## Generate RSA Private Key in PEM Format

```sh
openssl genpkey -algorithm RSA -out ~/.ssh/id_rsa.pem -pkeyopt rsa_keygen_bits:4096
```

## Extract the Public Key in OpenSSH Format

```sh
ssh-keygen -y -f ~/.ssh/id_rsa.pem > ~/.ssh/id_rsa.pub
# -y: instructs ssh-keygen to read a private key file and print the corresponding public key.
# -f ~/.ssh/id_rsa.pem: specifies the private key file from which to extract the public key.
```

## View key

```sh
cat ~/.ssh/id_rsa.pub
```
