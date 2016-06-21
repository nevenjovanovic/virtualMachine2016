#!/usr/bin/env /bin/bash

echo "-----------------------------------"
echo "Navigating to the citemgr directory…"
echo ""

cd /vagrant/citemgr

echo "-----------------------------------"
echo "Copying the configuration file for bulding the CTS Test Data here…"
echo ""

cp /vagrant/scripts/citemgr-cts-demo.gradle .

echo "-----------------------------------"
echo "Running the 'clean' task to prepare Gradle…"
echo ""

gradle clean

echo "-----------------------------------"
echo "Running the CITE Manager 'ctsttl' task in Gradle to process the XML files, using a TextInventory and Citaition Config file, into tabular representations of texts, and then into a single '.ttl' file expressing the corpus as RDF statement. This will take some time."
echo ""

gradle -Pproj=citemgr-cts-demo.gradle projects:ctsttl

echo "-----------------------------------"
echo "Copying the resulting file, 'cts.tll', into 'vagrant/data/' as 'cts-demo.ttl', for safekeeping."
echo ""

cp /vagrant/citemgr/projects/build/ttl/cts.ttl /vagrant/data/cts-demo.ttl

echo "-----------------------------------"
echo "Moving the TextInventory file cataloging this test data into place."
echo ""

cp /vagrant/cts-demo-corpus/inventory.xml /vagrant/cs2/sparqlcts/src/main/webapp/invs/inventory.xml

echo "-----------------------------------"
echo "Done!"
