#!/usr/bin/env /bin/bash

echo "-----------------------------------"
echo "Navigate to where Gradle/Fuseki stores data files, specifically the 'cts' data…"
echo ""
echo "   cd /vagrant/cs2/fuseki/fusekibase/databases/cts"
echo ""
cd /vagrant/cs2/fuseki/fusekibase/databases/cts
echo "-----------------------------------"
echo "Remove anything there, since we are loading new data…"
echo ""
echo "  rm *"
echo ""
rm *
echo "-----------------------------------"
echo "Use the 'tdbloader2' utility from Apache Jena to load our 'cts-template.ttl' file into a TDB Database…"
echo ""
echo "   /usr/bin/jena/bin/tdbloader2 --loc /vagrant/cs2/fuseki/fusekibase/databases/cts /vagrant/data/cts-template.ttl"
echo ""
/usr/bin/jena/bin/tdbloader2 --loc /vagrant/cs2/fuseki/fusekibase/databases/cts /vagrant/data/cts-template.ttl
echo "-----------------------------------"
echo "Done! The CTS Template data has been loaded."



