#!/bin/bash

### installing supervisor
sudo apt-get -y update
sudo apt-get -y install supervisor
sudo apt-get -y install iptables-persistent
sudo apt-get install ufw

sed -i "s+_HOME_+$HOME+g" supervisord.conf
sed -i "s+_USERNAME_+$1+g" supervisord.conf
sed -i "s+_PASSWORD_+$2+g" supervisord.conf

### setting up supervisor configuration
sudo cp supervisord.conf /etc/supervisor/supervisord.conf

cp $HOME/.dashcore/dashd $HOME/dashd
cp $HOME/.dashcore/dash-cli $HOME/dash-cli

### stoping daemon if it was running
file="$HOME/dashd-cli"
if [ -f "$file" ]
then
	echo "$file installed. Stopping dashd"
	$HOME/dashd-cli stop
else
	echo "$file not installed. If dashd is running you will need to kill it manually before proceeding."
	sudo ps -xa | grep "dashd"
fi

### starting supervisor
sudo service supervisor stop

### setup firewall
./firewall.sh
sudo service supervisor start

echo "Supervisor installed successfully!"