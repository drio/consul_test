#!/bin/bash

# install consul
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install consul

# Make sure consul is running
systemctl enable consul.service
systemctl start consul.service

# install latest envoy
curl -L https://func-e.io/install.sh | bash -s -- -b /usr/local/bin
export FUNC_E_PLATFORM=linux/amd64
func-e use 1.23.0
cp ~/.func-e/versions/1.23.0/bin/envoy /usr/local/bin/

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
apt install docker-ce -y
usermod -aG docker ubuntu

touch /home/ubuntu/infra-done.txt
