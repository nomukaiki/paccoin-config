## Install

#### Requirements

* Paccoin installed
    These files should exist:
    * ./paccoind
    * ./paccoin-cli
* Paccoin Sentinel installed
    This folder should exist
    * ./sentinel/

### Install steps
Go to the folder where you have installed Pac and is the location of ./paccoind
```
cd ~
```
Download the setup script and extract
```
wget https://github.com/nomukaiki/paccoin-config/releases/download/1/pac-masternode-setup.tar.gz
tar -xzvf pac-masternode-setup.tar.gz
cd pac-masternode-setup
```
Replace the <user> and <pass> with the login for the supervisor console.
```
USERNAME=admin && PASSWORD=pass && ./setup_supervisor.sh
```

### Access
If everything goes well, you can open supervisor here:
http://<your ip address>:9001/
