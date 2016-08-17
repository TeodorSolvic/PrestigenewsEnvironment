#!/bin/sh

apt-get update
apt-get install software-properties-common python-software-properties -y
add-apt-repository ppa:webupd8team/java -y
wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo 'deb http://packages.elasticsearch.org/elasticsearch/1.7/debian stable main' | tee /etc/apt/sources.list.d/elasticsearch.list
apt-get -y update
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install --force-yes -y elasticsearch oracle-java7-installer

update-rc.d elasticsearch defaults
service elasticsearch restart

cd /usr/share/
elasticsearch/bin/plugin -install mobz/elasticsearch-head
