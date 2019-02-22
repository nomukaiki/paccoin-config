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
wget -O pac-masternode-setup.tar.gz https://github.com/nomukaiki/paccoin-config/blob/master/pac-masternode-setup.tar.gz?raw=true
tar -xzvf pac-masternode-setup.tar.gz
cd pac-masternode-setup

```
Replace the _admin_ and _pass_ with the login for the supervisor console.
```
./setup_supervisor.sh USERNAME PASSWORD
```

### Access
If everything goes well, you can open supervisor here:
>>> http://_your ip address_:9001/
