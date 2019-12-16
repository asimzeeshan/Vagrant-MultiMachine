# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"

  config.vm.hostname = 'debian10'

  config.ssh.insert_key = false
  config.vm.boot_timeout = 800
  config.ssh.private_key_path = ["~/.ssh/id_rsa", "~/.vagrant.d/insecure_private_key"]
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 22, host: 2222

  # config.vm.network "forwarded_port", guest: 22, host: 22022, host_ip: "127.0.0.1"

  config.vm.network "private_network", ip: "192.168.33.10"

  # config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|  
    vb.gui = false
    # Use VBoxManage to customize the VM. For example to change memory:
    #vb.customize ["modifyvm", :id, "--memory", "1024"]
    #vb.customize ["modifyvm", :id, "--name", "LAMP (jessie64)"]
    vb.customize ["modifyvm", :id, "--ostype", "Debian_64"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    # By default set to 1, change it to amount of your CPUs
    vb.customize ["modifyvm", :id, "--cpus", "2" ]
    # Enable NAT
    # vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

    # Or uncomment line above for Automatic set VirtualBox guest CPU count to the number of host cores
    # WARNING ! Works on Linux Host ONLY
    # vb.customize ["modifyvm", :id, "--cpus", `grep "^processor" /proc/cpuinfo | wc -l`.chomp ]
    
    # Customize the VM name:
    vb.name = "debian10"
    # Customize the amount of memory on the VM:
    vb.memory = "512"
    # Customize the number of vCPUs on the VM:
    vb.cpus = 2
    # Add second network
    # config.vm.network "private_network", :type => 'dhcp', :name => 'vboxnet1', :adapter => 2
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

end
