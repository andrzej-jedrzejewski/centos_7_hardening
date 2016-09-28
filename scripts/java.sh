#!/bin/bash

apt-add-repository ppa:webupd8team/java -y
apt-get update -y
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
apt-get install oracle-java8-installer -y

touch /etc/profile.d/oraclejdk.sh
echo "export PATH=$PATH:/usr/lib/jvm/oracle_jdk8/bin:/usr/lib/jvm/oracle_jdk8/db/bin:/usr/lib/jvm/oracle_jdk8/jre/bin" >> /etc/profile.d/oraclejdk.sh
echo "export JAVA_HOME=/usr/lib/jvm/oracle_jdk8" >> /etc/profile.d/oraclejdk.sh