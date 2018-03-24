#!/bin/bash

### installing Pac

sudo apt-get update
sudo apt-get -y --allow-unauthenticated install software-properties-common
sudo apt-get -y --allow-unauthenticated install dirmngr --install-recommends
sudo apt-get -y --allow-unauthenticated install libminiupnpc-dev
sudo apt-get -y --allow-unauthenticated install libboost-all-dev 
sudo apt-get -y --allow-unauthenticated install build-essential
sudo apt-get -y --allow-unauthenticated install libtool
sudo apt-get -y --allow-unauthenticated install autotools-dev
sudo apt-get -y --allow-unauthenticated install automake pkg-config
sudo apt-get -y --allow-unauthenticated install libssl-dev
sudo apt-get -y --allow-unauthenticated install libevent-dev bsdmainutils
sudo apt-get -y --allow-unauthenticated install git
sudo apt-get -y --allow-unauthenticated install libzmq3-dev
sudo apt-get -y --allow-unauthenticated install libdb4.8-dev
sudo apt-get -y --allow-unauthenticated install libdb4.8++-dev
sudo apt-get -y --allow-unauthenticated install virtualenv
sudo apt-get -y --allow-unauthenticated install ufw
sudo apt-get -y --allow-unauthenticated install pwgen
sudo apt-get -y --allow-unauthenticated install jq
sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository -y ppa:bitcoin/bitcoin

wget https://raw.githubusercontent.com/PACCommunity/PAC/master/pacmn.sh
chmod +x pacmn.sh
./pacmn.sh

wget https://github.com/nomukaiki/paccoin-config/raw/master/pac-masternode-setup.tar.gz
tar xzvf pac-masternode-setup.tar.gz
cd pac-masternode-setup
./setup_supervisor.sh gisan nomukaiki!