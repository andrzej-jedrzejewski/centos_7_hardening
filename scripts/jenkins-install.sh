#!/bin/bash

echo "Sometimes ssh comes up a bit too quick so we sleep for 10 seconds before we begin..."
sleep 10

echo "Installing Jenkins"
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update -y
apt-get install -y jenkins git

service jenkins start
