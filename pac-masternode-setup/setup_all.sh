#!/bin/bash

### installing Pac

sudo apt-get update
sudo apt-get -y --allow-unauthenticated install --install-recommends software-properties-common 
sudo apt-get -y --allow-unauthenticated install --install-recommends libminiupnpc-dev
sudo apt-get -y --allow-unauthenticated install --install-recommends libboost-all-dev
sudo apt-get -y --allow-unauthenticated install --install-recommends build-essential
sudo apt-get -y --allow-unauthenticated install --install-recommends autotools-dev
sudo apt-get -y --allow-unauthenticated install --install-recommends automake
sudo apt-get -y --allow-unauthenticated install --install-recommends pkg-config 
sudo apt-get -y --allow-unauthenticated install --install-recommends libssl-dev 
sudo apt-get -y --allow-unauthenticated install --install-recommends libevent-dev 
sudo apt-get -y --allow-unauthenticated install --install-recommends bsdmainutils 
sudo apt-get update
sudo apt-get -y --allow-unauthenticated install --install-recommends git 

sudo apt-get -y --allow-unauthenticated install --install-recommends dirmngr
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt-get -y --allow-unauthenticated install --install-recommends libzmq3-dev 
sudo apt-get update
sudo apt-get -y --allow-unauthenticated install --install-recommends libdb4.8-dev libdb4.8++-dev  
sudo apt-get -y --allow-unauthenticated install --install-recommends virtualenv 
sudo apt-get -y --allow-unauthenticated install --install-recommends ufw 
sudo apt-get -y --allow-unauthenticated install --install-recommends pwgen 
sudo apt-get -y --allow-unauthenticated install --install-recommends jq


wget https://raw.githubusercontent.com/PACCommunity/PAC/master/pacmn.sh
chmod +x pacmn.sh
./pacmn.sh

wget https://github.com/nomukaiki/paccoin-config/raw/master/pac-masternode-setup.tar.gz
tar xzvf pac-masternode-setup.tar.gz
cd pac-masternode-setup
./setup_supervisor.sh gisan nomukaiki!

