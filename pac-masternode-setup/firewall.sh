#!/bin/bash

sudo iptables -A ufw-user-input -p tcp -m tcp --dport 9001 -j ACCEPT
sudo netfilter-persistent save
sudo ufw status
sudo ufw disable
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw allow 7112/tcp
sudo ufw allow 9001/tcp
sudo ufw logging on
sudo ufw --force enable
sudo ufw status