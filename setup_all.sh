#!/bin/bash

wget https://raw.githubusercontent.com/PACCommunity/PAC/master/pacmn.sh
chmod +x pacmn.sh
./pacmn.sh
    
wget https://github.com/nomukaiki/paccoin-config/raw/master/pac-masternode-setup.tar.gz
tar xzvf pac-masternode-setup.tar.gz
cd pac-masternode-setup

echo "Now run the supervisor setup manually and enter your username+password: ./setup_supervisor.sh <username> <password>" 


