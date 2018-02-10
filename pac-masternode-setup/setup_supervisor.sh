#!/bin/bash

### installing supervisor
sudo apt-get -y update
sudo apt-get -y install supervisor
sudo apt-get -y install iptables-persistent

### setup firewall
sudo iptables -A ufw-user-input -p tcp -m tcp --dport 9001 -j ACCEPT
sudo netfilter-persistent save

### setting up supervisor configuration
sed -i "s+_HOME_+$HOME+g" supervisord.conf
sudo cp supervisord.conf /etc/supervisord.conf

sed -i "s+_HOME_+$HOME+g" sentinel-run.sh
cp sentinel-run.sh ~/sentinel/run.sh
chmod +x ~/sentinel/run.sh

sed -i "s+_HOME_+$HOME+g" paccoin-daemon.sh
sudo cp paccoin-daemon.sh /usr/bin/paccoin-daemon.sh
sudo chmod +x /usr/bin/paccoin-daemon.sh

### setting up the service and launch on startup
sudo cp init.d.supervisord /etc/init.d/supervisord
sudo chmod +x /etc/init.d/supervisord

sudo update-rc.d supervisord defaults

### installing sentinel dependencies on global python 
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

### starting supervisor
sudo service supervisord start

### removing existing crontab and adding the managed from supervisor
crontab -r
echo '* * * * * supervisorctl start sentinel' > crontab.txt
crontab 'crontab.txt'
