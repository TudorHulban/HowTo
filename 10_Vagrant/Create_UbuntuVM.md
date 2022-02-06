```vagrant
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.disksize.size = '16GB'
  config.vm.box_check_update = false
  config.vm.network "private_network", type: "dhcp"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
  end
end
```
Build with:
```
vagrant up
```
Needs:
```
vagrant plugin install vagrant-disksize
```
Connect:
```
vagrant ssh
```
