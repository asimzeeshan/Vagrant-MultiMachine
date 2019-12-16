#!/bin/bash

sudo mkdir /root/.ssh
sudo chmod 700 /root/.ssh
sudo touch /root/.ssh/authorized_keys
sudo chmod 600 /root/.ssh/authorized_keys

if [ -n "$(command -v yum)" ]; then
    sudo yum update
    sudo yum install -y wget
elif [ -n "$(command -v apt-get)" ]; then
    sudo apt-get update
    sudo apt-get install -y wget
else
    echo "error can't install package wget"
fi

wget https://vagrant.me/asim.pub -O ~/.ssh/id_rsa.pub
wget https://vagrant.me/ansible.pub -O ~/.ssh/id_rsa.pub
cat /root/.ssh/asim.pub >> ~/.ssh/authorized_keys
cat /root/.ssh/ansible.pub >> ~/.ssh/authorized_keys