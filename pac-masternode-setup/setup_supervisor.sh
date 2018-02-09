#!/bin/bash

### installing supervisor
sudo apt-get update
sudo apt-get install supervisor
sudo apt-get install iptables-persistent

### removing existing crontab and adding the managed from supervisor
sudo crontab -r
sudo crontab '* * * * * supervisorctl start sentinel'

### setting up supervisor configuration
cp supervisord.conf /etc/supervisord.conf

### setting up the service and launch on startup
cp init.d.supervisord /etc/init.d/supervisord
chmod +x /etc/init.d/supervisord

update-rc.d supervisord defaults

### setup firewall
iptables -A ufw-user-input -p tcp -m tcp --dport 9001 -j ACCEPT
sudo netfilter-persistent save

### starting supervisor
service supervisord start