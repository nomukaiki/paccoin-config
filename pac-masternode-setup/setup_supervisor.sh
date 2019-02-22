#!/bin/bash

### installing supervisor
sudo apt-get -y update
sudo apt-get -y install supervisor
sudo apt-get -y install iptables-persistent

### setup firewall
./firewall.sh

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
file="$HOME/paccoin-cli"
if [ -f "$file" ]
then
	echo "$file installed. Stopping paccoind"
	$HOME/paccoin-cli stop
else
	echo "$file not installed. If paccoind is running you will need to kill it manually before proceeding."
	sudo ps -xa | grep "paccoind"
fi

### starting supervisor
sudo service supervisor start

### removing existing crontab and adding the managed from supervisor
sudo crontab -r
echo '* * * * * supervisorctl start sentinel' > crontab.txt
sudo crontab 'crontab.txt'

echo "Supervisor for Masternode installed successfully!"