#!/usr/bin/env bash


#
# Repository for an early-21st-century version of gradle:
add-apt-repository ppa:cwchien/gradle
apt-get update


#########################################################
### Install packages required for HMT editing ###########
#########################################################

# Clean up any catastrophic reformatting that
# 'git clone' could introduce on a Windows box:
apt-get install -y dos2unix
/usr/bin/dos2unix /vagrant/system/*sh
/usr/bin/dos2unix /vagrant/system/dotprofile
/usr/bin/dos2unix /vagrant/scripts/*sh

# and add bomstrip utils in case XML Copy Editor
# or evil Windows software tries to insert a BOM
# in your editorial work:
apt-get install -y bomstrip

# version control
apt-get install -y git

# an easy editor
apt-get install -y nano


# JDK bundle
apt-get install -y openjdk-7-jdk
apt-get -y install groovy
apt-get -y install gradle

# Jena and Jena-Fuseki
cd /usr/bin
sudo curl http://apache.mirrors.ionfish.org/jena/binaries/apache-jena-3.0.1.tar.gz -o apache-jena-3.0.1.tar.gz
sudo tar zxfv apache-jena-3.0.1.tar.gz
sudo rm apache-jena-3.0.1.tar.gz

sudo curl http://apache.mirrors.ionfish.org/jena/binaries/apache-jena-fuseki-2.3.1.tar.gz -o apache-jena-fuseki-2.3.1.tar.gz
sudo tar zxfv apache-jena-fuseki-2.3.1.tar.gz
sudo rm apache-jena-fuseki-2.3.1.tar.gz


#########################################################
### Configure system and user settings        ###########
#########################################################


# Set up vagrant user account:
cp /vagrant/system/dotprofile /home/vagrant/.profile
chown vagrant:vagrant /home/vagrant/.profile

#########################################################
### Clone/Pull/Update Some Repos  ###########
#########################################################

cd /vagrant
git clone https://github.com/cite-architecture/citemgr.git
git clone https://github.com/cite-architecture/cs2.git

#########################################################
### Set Up CITE Manager  ###########
#########################################################

cd citemgr
git pull
git checkout cs2
cp ../scripts/cts-test.gradle .
gradle clean

#########################################################
### Set Up CITE Servlet 2  ###########
#########################################################

cd /vagrant/cs2
git pull

#########################################################
### Set Up Stuff for Fuseki  ###########
#########################################################

mkdir /vagrant/databases
mkdir /vagrant/data



