#!/bin/bash

### installing supervisor
sudo apt-get -y update
sudo apt-get -y install supervisor
sudo apt-get -y install iptables-persistent

### setup firewall
sudo iptables -A ufw-user-input -p tcp -m tcp --dport 9001 -j ACCEPT
sudo netfilter-persistent save

sed -i "s+_HOME_+$HOME+g" paccoin-daemon.sh
sed -i "s+_HOME_+$HOME+g" sentinel-run.sh
sed -i "s+_HOME_+$HOME+g" supervisord.conf
sed -i "s+_USERNAME_+$1+g" supervisord.conf
sed -i "s+_PASSWORD_+$2+g" supervisord.conf

### setting up supervisor configuration
sudo cp supervisord.conf /etc/supervisor/supervisord.conf

cp sentinel-run.sh ~/sentinel/run.sh
chmod +x ~/sentinel/run.sh

sudo cp paccoin-daemon.sh /usr/bin/paccoin-daemon.sh
sudo chmod +x /usr/bin/paccoin-daemon.sh

### installing sentinel dependencies on global python 
wget https://bootstrap.pypa.io/get-pip.py
sudo -H python get-pip.py

### stoping pac daemon if it was running
$HOME/paccoin-cli stop

### starting supervisor
sudo service supervisor start

### removing existing crontab and adding the managed from supervisor
crontab -r
echo '* * * * * supervisorctl start sentinel' > crontab.txt
crontab 'crontab.txt'

echo "Supervisor for Masternode installed successfully!"