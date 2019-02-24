#!/bin/bash

### installing supervisor
sudo apt-get -y update
sudo apt-get -y install supervisor
sudo apt-get -y install iptables-persistent

sed -i "s+_HOME_+$HOME+g" dash-daemon.sh
sed -i "s+_HOME_+$HOME+g" sentinel-run.sh
sed -i "s+_HOME_+$HOME+g" supervisord.conf
sed -i "s+_USERNAME_+$1+g" supervisord.conf
sed -i "s+_PASSWORD_+$2+g" supervisord.conf

### setting up supervisor configuration
sudo cp supervisord.conf /etc/supervisor/supervisord.conf

cp sentinel-run.sh ~/sentinel/run.sh
chmod +x ~/sentinel/run.sh

sudo cp dash-daemon.sh /usr/bin/dash-daemon.sh
sudo chmod +x /usr/bin/dash-daemon.sh

### installing sentinel dependencies on global python 
wget https://bootstrap.pypa.io/get-pip.py
sudo -H python get-pip.py

### stoping daemon if it was running
file="$HOME/.dashcore/dashd-cli"
if [ -f "$file" ]
then
	echo "$file installed. Stopping dashd"
	$HOME/.dashcore/dashd-cli stop
else
	echo "$file not installed. If dashd is running you will need to kill it manually before proceeding."
	sudo ps -xa | grep "dashd"
fi

### starting supervisor
sudo service supervisor stop

### removing existing crontab and adding the managed from supervisor
crontab -r
sudo crontab -r
echo '* * * * * supervisorctl start sentinel' > crontab.txt
sudo crontab 'crontab.txt'

### setup firewall
./firewall.sh
sudo service supervisor start

echo "Supervisor installed successfully!"