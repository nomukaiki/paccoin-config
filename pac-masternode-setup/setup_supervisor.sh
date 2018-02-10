#!/bin/bash

### installing supervisor
sudo apt-get update
sudo apt-get install supervisor
sudo apt-get install iptables-persistent

### setup firewall
iptables -A ufw-user-input -p tcp -m tcp --dport 9001 -j ACCEPT
sudo netfilter-persistent save

### setting up supervisor configuration
cp supervisord.conf /etc/supervisord.conf

cp sentinel-run.sh /root/sentinel/run.sh
cp paccoin-daemon.sh /usr/bin/paccoin-daemon.sh
chmod +x /usr/bin/paccoin-daemon.sh

### setting up the service and launch on startup
cp init.d.supervisord /etc/init.d/supervisord
chmod +x /etc/init.d/supervisord

update-rc.d supervisord defaults

### installing sentinel dependencies on global python 
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py

### starting supervisor
service supervisord start

### removing existing crontab and adding the managed from supervisor
crontab -r
echo '* * * * * supervisorctl start sentinel' > crontab.txt
crontab 'crontab.txt'
