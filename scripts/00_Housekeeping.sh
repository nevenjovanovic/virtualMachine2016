#!/usr/bin/env /bin/bash

echo "-----------------------------------"
echo "Housekeeping: Update all Git repositories…"
echo "-----------------------------------"
cd /vagrant/cs2
git pull
cd /vagrant/cite_test_ttl
git pull
cd /vagrant/citemgr
git pull
cd /vagrant/cts-demo-corpus
git pull
echo "-----------------------------------"
echo ""
