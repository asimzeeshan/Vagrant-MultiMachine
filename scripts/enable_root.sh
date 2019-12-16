#!/bin/bash

sudo mkdir /root/.ssh
sudo chmod 700 /root/.ssh
sudo touch /root/.ssh/authorized_keys
sudo chmod 600 /root/.ssh/authorized_keys
cat /vagrant/keys/*.pub >> ~/.ssh/authorized_keys