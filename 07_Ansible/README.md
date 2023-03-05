# Ansible: Installation on Ubuntu and first steps

## On Ansible commander

Prerequisites:

```sh
sudo apt install software-properties-common
```

### User Management

#### 1. Create user ansible, owner of installation

```bash
sudo adduser ansible # with password ansible
```

#### 2. Add ansible user in sudo group and do not request password

```bash
sudo visudo # equivalent to sudo vi /etc/sudoers
root    ALL=(ALL:ALL) ALL
ansible ALL=(ALL:ALL) NOPASSWD:ALL
```

or add a new file in `/etc/sudoers.d` ex.:

```sh
sudo vi 77-automation-ansible
# add
remote-user-name ALL=(ALL:ALL) NOPASSWD:ALL
```

check it is working with:

```sh
ansible all -m ping -u user-connecting
```

### Install Ansible binaries

Switch to ansible user, no password should be requested on sudo:

```bash
sudo apt install ansible
# verify
ansible --version
```

### Configure hosts to control

As ansible user create hosts file:

```sh
touch ~/hosts
```

Add the hosts file to the ansible configuration:

```sh
vi .ansible.cfg 
# and add
[defaults]
inventory      = ./hosts
```

Add hosts to control IPs in the newly created file:

```sh
[local]
127.0.0.1

[dev]
192.168.1.23
192.168.1.24
```

#### Generate SSH key and add it

As user ansible:

```sh
ssh-keygen   # no passphrase
```

#### Start actions

Create YAML file with actions. Run as `ansible` user:

```bash
ansible-playbook file.yml
```

#### Upgrade Ansible version

```sh
sudo -H pip install --upgrade ansible
ansible --version
```

## On hosts to control

Repeat steps **1**, **2**.

### Create SSH folder and files

```sh
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
```

Edit authorized keys file and add the SSH key of the ansible user.
Verify that nothing is requested on login request:

```sh
ssh host-IP
```

### Install Python

```sh
sudo apt-get install -y python3
```

## Resources

```html
https://galaxy.ansible.com/
https://www.safaribooksonline.com/library/view/ansible-up-and/9781491915318/ch04.html
```
