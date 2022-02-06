# Ansible: Installation on Debian and first steps
## On Ansible commander
### User Management
#### 1. Create user ansible, owner of installation
```bash
sudo adduser ansible # with password ansible
```
#### 2. Add ansible user in sudo group and do not request password
```bash
sudo visudo
root    ALL=(ALL:ALL) ALL
ansible ALL=(ALL:ALL) NOPASSWD:ALL
```
#### 3. Install Ansible binaries
Switch to ansible user, no password should be requested on sudo:
```bash
sudo apt-get update
sudo apt-get install -y git python python-dev python-pip openssl ansible
# verify
ansible --version
```
### Connect with SSH key
```
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
```
Edit authorized keys file and add the SSH key of the user trying to connect.
#### Ubuntu
```
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```
#### 4. Adjust configuration:
```bash
sudo vi /etc/ansible/ansible.cfg 
# update to
inventory      = /etc/ansible/hosts
sudo_user      = root
```
#### 5. Configure hosts to control
```bash
sudo vi /etc/ansible/hosts
# add
192.168.1.23
192.168.1.24
```
#### 6. Generate SSH key and add it
As user ansible:
```bash
ssh-keygen   # no passphrase
```
For each host:
```bash
ssh-copy-id ansible@<host IP>
```
Verify that nothing is requested on login request: 
```bash
ssh ansible@<host IP>
```
#### 7. Start actions
Create YAML file with actions. Run as `ansible` user:
```bash
ansible-playbook file.yml
```
#### 8. Upgrade Ansible version
```bash
sudo -H pip install --upgrade ansible
ansible --version
```
## On hosts to control
Repeat steps **1**, **2**.
### Install Python
```bash
sudo apt-get install -y python
```
## Resources
```html
https://galaxy.ansible.com/
https://www.safaribooksonline.com/library/view/ansible-up-and/9781491915318/ch04.html
```
