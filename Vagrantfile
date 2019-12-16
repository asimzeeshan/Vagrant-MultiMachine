# -*- mode: ruby -*-
# vi: set ft=ruby :

servers=[
  {
    :hostname => "debian10",
    :ip => "192.168.33.10",
    :box => "debian/buster64",
    :type => "Debian_64",
    :ram => 512,
    :cpu => 1
  },
  {
    :hostname => "debian9",
    :ip => "192.168.33.11",
    :box => "debian/stretch64",
    :type => "Debian_64",
    :ram => 512,
    :cpu => 1
  },
  {
    :hostname => "ubuntu1804",
    :ip => "192.168.33.12",
    :box => "ubuntu/bionic64",
    :type => "Ubuntu_64",
    :ram => 512,
    :cpu => 1
  },
  {
    :hostname => "ubuntu1910",
    :ip => "192.168.33.13",
    :box => "ubuntu/disco64",
    :type => "Ubuntu_64",
    :ram => 512,
    :cpu => 1
  },
  {
    :hostname => "CentOS7",
    :ip => "192.168.33.14",
    :box => "centos/7",
    :type => "RedHat_64",
    :ram => 512,
    :cpu => 1
  },
  {
    :hostname => "CentOS8",
    :ip => "192.168.33.15",
    :box => "centos/8",
    :type => "RedHat_64",
    :ram => 512,
    :cpu => 1
  },
  {
    :hostname => "Fedora31",
    :ip => "192.168.33.16",
    :box => "fedora/31-cloud-base",
    :type => "Fedora_64",
    :ram => 512,
    :cpu => 1
  },
  {
    :hostname => "ubuntu1604",
    :ip => "192.168.33.17",
    :box => "ubuntu/xenial64",
    :type => "Ubuntu_64",
    :ram => 512,
    :cpu => 1
  }
]

Vagrant.configure("2") do |config|

  servers.each do |machine|
    config.vm.define machine[:hostname] do |node|
        node.vm.box = machine[:box]
        node.vm.hostname = machine[:hostname]
        node.vm.box_check_update = false

        node.ssh.insert_key = false
        node.vm.boot_timeout = 800
        node.ssh.private_key_path = ["~/.ssh/id_rsa", "~/.vagrant.d/insecure_private_key"]
        node.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

        node.vm.network "private_network", ip: machine[:ip]
        node.vm.provider "virtualbox" do |vb|
            vb.gui = false

            vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
            vb.customize ["modifyvm", :id, "--name", machine[:hostname]]
            vb.customize ["modifyvm", :id, "--ostype", machine[:type]]
            vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
            vb.customize ["modifyvm", :id, "--cpus", machine[:cpu] ]
        end

        # Enable provisioning with a shell script. Additional provisioners such as
        # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
        # documentation for more information about their specific syntax and use.
        node.vm.provision :shell, path: "scripts/enable_root.sh"

    end
  end

end
