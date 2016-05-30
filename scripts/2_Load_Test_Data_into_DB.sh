#!/usr/bin/env /bin/bash

echo "-----------------------------------"
echo "Natigate to where Gradle/Fuseki stores data files, specifically the 'ctsTest' data…"
echo "   cd /vagrant/cs2/fuseki/fusekibase/databases/ctsTest"
cd /vagrant/cs2/fuseki/fusekibase/databases/ctsTest
echo "-----------------------------------"
echo "Remove anything there, since we are loading new data…"
echo "  rm *"
rm *
echo "-----------------------------------"
echo "Use the 'tdbloader2' utility from Apache Jena to load our 'cts-test.ttl' file into a TDB Database…"
echo "   /usr/bin/jena/bin/tdbloader2 --loc /vagrant/cs2/fuseki/fusekibase/databases/ctsTest /vagrant/data/cts-test.ttl"
/usr/bin/jena/bin/tdbloader2 --loc /vagrant/cs2/fuseki/fusekibase/databases/ctsTest /vagrant/data/cts-test.ttl
echo "-----------------------------------"
echo "Done!"



