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
Replace the _admin_ and _pass_ with the login for the supervisor console.
```
USERNAME=admin && PASSWORD=pass && ./setup_supervisor.sh
```

### Access
If everything goes well, you can open supervisor here:
>>> http://_your ip address_:9001/
