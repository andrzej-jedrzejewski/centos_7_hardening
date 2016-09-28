#!/bin/bash

echo "We're going to use Openstack's jenkins-job builder to setup our initial jobs." 
apt-get install -y jenkins-job-builder

echo "Setup the preconfigured jobs"
mkdir /etc/jenkins_jobs
mv /tmp/jenkins_jobs.ini /etc/jenkins_jobs
jenkins-jobs update /tmp/build_jenkins_master.yaml
jenkins-jobs update /tmp/build_jenkins_slave.yaml
jenkins-jobs update /tmp/add_slave.yaml
