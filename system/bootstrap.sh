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
#apt-get install -y openjdk-7-jdk
apt-get -y -q update
apt-get -y -q upgrade
apt-get -y -q install software-properties-common htop
add-apt-repository ppa:webupd8team/java
apt-get -y -q update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get -y -q install oracle-java8-installer
apt-get -y -q install oracle-java7-installer
update-java-alternatives -s java-8-oracle
apt-get -y install groovy
apt-get -y install gradle

# Jena and Jena-Fuseki
cd /usr/bin
sudo curl http://apache.mirrors.ionfish.org/jena/binaries/apache-jena-3.0.1.tar.gz -o apache-jena-3.0.1.tar.gz
sudo tar zxfv apache-jena-3.0.1.tar.gz
sudo rm apache-jena-3.0.1.tar.gz
sudo ln -s apache-jena-3.0.1 jena

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
cp ../scripts/cts-test.gradle .
cp ../scripts/ptolemy-test.gradle .
#gradle clean

#########################################################
### Set Up CITE Servlet 2  ###########
#########################################################

cd /vagrant/cs2
git pull
git checkout vm2016
#gradle clean

#########################################################
### Set Up Fuseki with Test Data  ###########
#########################################################


su vagrant << EOF
	
	
	export FUSEKI_BASE=/vagrant/cs2/fuseki/fusekibase
	export JENA_HOME=/usr/bin/jena

	cd /vagrant/cs2
	gradle clean
	gradle config
	mkdir -p /vagrant/cs2/sparqlcts/src/main/webapp/invs
	cp /vagrant/testcorpus2016/testinventory-2016.xml /vagrant/cs2/sparqlcts/src/main/webapp/invs/inventory.xml
	cp /vagrant/demo-corpus/ptolemy_inventory.xml /vagrant/cs2/sparqlcts/src/main/webapp/invs/ptolemy_inventory.xml
	cd /vagrant/cs2/sparqlcts
	echo '##################################################'
	echo '## The following tests are supposed to fail!    ##'
	echo '##################################################'

	gradle farmIntegrationTest

	echo '##################################################'
	echo '## The preceding tests were supposed to fail!   ##'
	echo '##################################################'


	cd /vagrant/cs2/fuseki/fusekibase/databases/ds
	rm *
	cd /vagrant/cs2/fuseki/fusekibase/databases
	mkdir ptolemy


	echo '##################################################'
	echo '## Loading CTS Test Data into DB                ##'
	echo '##################################################'

	/usr/bin/jena/bin/tdbloader2 --loc /vagrant/cs2/fuseki/fusekibase/databases/ds /vagrant/testcorpus2016/testcorpus2016.ttl

EOF
