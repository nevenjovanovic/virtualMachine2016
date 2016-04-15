#!/usr/bin/env /bin/bash

cd /vagrant/citemgr
gradle -Pproj=cts-test.gradle ctsttl
cp /vagrant/citemgr/projects/build/ttl/corpus.ttl /vagrant/data/test-corpus.ttl
