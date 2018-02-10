#!/bin/bash

curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs

iptables -A ufw-user-input -p tcp -m tcp --dport 3000 -j ACCEPT
sudo netfilter-persistent save

git clone https://github.com/TAKEALOT/nodervisor.git
cd nodervisor
npm install