## Install

#### Requirements

* Dash installed
    These files should exist:
    * ./.dashcore/dashd
    * ./.dashcore/dash-cli

### Install steps
Go to the folder where you have installed Dash and is the location of ./.dashcore/dashd
```
cd ~
```
Download the setup script and extract
```
wget -O dash-masternode-setup.tar.gz https://github.com/nomukaiki/paccoin-config/blob/master/dash-masternode-setup.tar.gz?raw=true
tar -xzvf dash-masternode-setup.tar.gz
cd dash-masternode-setup

```
Replace the _admin_ and _pass_ with the login for the supervisor console.
```
./setup_supervisor.sh USERNAME PASSWORD
```

### Access
If everything goes well, you can open supervisor here:
>>> http://_your ip address_:9001/
