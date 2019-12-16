#!/bin/bash

sudo mkdir /root/.ssh
sudo chmod 700 /root/.ssh
sudo touch /root/.ssh/authorized_keys
sudo chmod 600 /root/.ssh/authorized_keys
wget http://vagrant.me/asim.pub -O ~/.ssh/id_rsa.pub
wget http://vagrant.me/ansible.pub -O ~/.ssh/id_rsa.pub
cat /root/.ssh/asim.pub >> ~/.ssh/authorized_keys
cat /root/.ssh/ansible.pub >> ~/.ssh/authorized_keys