# -*- mode: ruby -*-
# vi:set ft=ruby sw=2 ts=2 sts=2:

$script = <<-SCRIPT
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
SCRIPT
#

NUM_NODE = 1
IMAGE_BOX = "ubuntu/focal64"
NODE_NAME = "svr"
NODE_MEM = 6100
NODE_CPU = 2

IP_NW = "192.168.56."
NODE_IP_START = 10

Vagrant.configure("2") do |config|
  config.vm.box = "#{IMAGE_BOX}"
  config.vm.box_check_update = false

  # Provision Nodes).each do |i|
  (1..NUM_NODE).each do |i|
    config.vm.define "#{NODE_NAME}0#{i}" do |node|
        node.vm.provider "virtualbox" do |vb|
            vb.name = "#{NODE_NAME}#{i}"
            vb.memory = "#{NODE_MEM}"
            vb.cpus = "#{NODE_CPU}"
           end
        node.vm.hostname = "#{NODE_NAME}#{i}"
        node.vm.network :private_network, ip: IP_NW + "#{NODE_IP_START + i}"
        node.vm.network "public_network", bridge: "Realtek PCIe GbE Family Controller #3"
        node.vm.network "forwarded_port", guest: 80, host: "80"
        node.vm.network "forwarded_port", guest: 443, host: "443"
        #node.vm.provision "shell", inline: $script
        #node.vm.provision "setup-hosts", :type => "shell", :path => "ubuntu/vagrant/setup-hosts.sh" do |s|
      end
        
   end
end
  