Vagrant.configure("2") do |config|
#every Vagrant dev environment requires a box
#how base box is ubuntu18
    config.vm.box = "ubuntu/bionic64"

#creating a private network which allows host-only access to the machine
#using a specific ip address
    config.vm.network "private_network", ip: "192.168.32.10"

        config.vm.provider "virtualbox" do |vb|
# Display the VirtualBox GUI when booting the machine
        vb.gui = true

# Customize the amount of memory on the VM:
        vb.memory = "2048"
        vb.name = "storelift-dev"
    end
# Add provisioner for Vagrant using ansible on the guest machine
# Avoid installing unnecessary softwares on our host machine
    config.vm.provider "ansible_local" do |ansible|
        ansible.playbook = "provision/playbook.yml"
        ansible.sudo = true
    end

end