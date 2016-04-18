#!/usr/bin/env /bin/bash

cd /vagrant/cs2
gradle clean
gradle config
mkdir -p /vagrant/cs2/sparqlcts/src/main/webapp/invs
cp /vagrant/testcorpus2016/testinventory-2016.xml /vagrant/cs2/sparqlcts/src/main/webapp/invs/inventory.xml
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


echo '##################################################'
echo '## Loading CTS Test Data into DB                ##'
echo '##################################################'

/usr/bin/jena/bin/tdbloader2 --loc /vagrant/cs2/fuseki/fusekibase/databases/ds /vagrant/testcorpus2016/testcorpus2016.ttl


