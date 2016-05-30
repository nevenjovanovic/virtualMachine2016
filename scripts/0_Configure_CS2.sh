#!/usr/bin/env /bin/bash

echo "-----------------------------------"
echo "Navigate to the cs2 directory…"
echo "   cd /vagrant/cs2"
cd /vagrant/cs2
echo "-----------------------------------"
echo "Make sure Gradle is working properly, and let it download a million dependencies…"
echo "   gradle clean"
gradle clean
echo "-----------------------------------"
echo "Run the 'configure' task in Gradle to set up the Database…"
echo "   gradle configure"
gradle configure
echo "-----------------------------------"
echo "Create an 'invs' directory where SparqlCTS can find text inventory files…"
echo "   mkdir -p /vagrant/cs2/sparqlcts/src/main/webapp/invs"
mkdir -p /vagrant/cs2/sparqlcts/src/main/webapp/invs
echo "-----------------------------------"
echo "Navigate to the SparqlCTS directory…"
echo "   cd /vagrant/cs2/sparqlcts"
cd /vagrant/cs2/sparqlcts
echo "-----------------------------------"
echo "Run the Integration Tests for SparqlCTS."
echo "THESE WILL ALL FAIL! THERE IS NO DATA YET!"
echo "…but it will allow Gradle to set up the directory structure for the database."
echo "(It will take some time to load, run, and fail all the tests."
echo "  gradle farmIntegrationTest"
gradle farmIntegrationTest
echo "-----------------------------------"
echo "Done!"
