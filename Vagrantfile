# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


 config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/xenial64"
    ubuntu.vm.hostname = "ubuntu"
    ubuntu.vm.network :forwarded_port, guest: 80, host: 8080
    ubuntu.vm.network :private_network, ip: "192.168.33.10"
    ubuntu.vm.synced_folder "./skukit", "/vagrant", nfs:true
    ubuntu.vm.provider "virtualbox" do |vb|
     vb.name = "ubuntu16"
     vb.memory = "1024"
    end
    ubuntu.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y git mc 
SHELL
end

 config.vm.define "centos" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.hostname = "centos"
    centos.vm.network :forwarded_port, guest: 80, host: 8011
    centos.vm.network :forwarded_port, guest: 3000, host: 3011
    centos.vm.network :private_network, ip: "192.168.33.11"
    centos.vm.synced_folder "./skukit", "/vagrant", nfs:true
    centos.vm.provider "virtualbox" do |vb|
     vb.name = "centos7"
     vb.memory = "1024"
    end
    centos.vm.provision "shell", inline: <<-SHELL
     yum update -y
     yum install epel-release
     yum install -y docker-ce net-tools
#     yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo
     systemctl start docker
SHELL
end

 config.vm.define "rhce" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.hostname = "rhce"
    centos.vm.network :forwarded_port, guest: 80, host: 8888
    centos.vm.network :private_network, ip: "192.168.33.12"
    centos.vm.synced_folder "./rhce", "/vagrant", nfs:true
    centos.vm.provider "virtualbox" do |vb|
     vb.name = "rhce"
     vb.memory = "512"
    end
    centos.vm.provision "shell", inline: <<-SHELL
     yum update -y
SHELL
end

end