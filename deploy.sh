#! /usr/bin/env bash
set -eu

tar -czvf dash-masternode-setup.tar.gz dash-masternode-setup
tar -czvf pac-masternode-setup.tar.gz pac-masternode-setup

git add .
git commit -a -m "Deploying"
git push
