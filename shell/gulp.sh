#!/usr/bin/env bash
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

apt-get update -y
apt-get install nodejs -y
apt-get install npm -y
apt-get install build-essential -y
npm install gulp -g
sudo ln -s /usr/bin/nodejs /usr/bin/node
