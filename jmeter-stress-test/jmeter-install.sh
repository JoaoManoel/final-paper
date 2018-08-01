#!/bin/bash

echo "Installing InfluxDB"
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

apt-get update -y

sudo apt-get install -y default-jre influxdb

echo "Starting InfluxDB"
service influxdb start

curl -POST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE this_socks"

cat >> /etc/environment <<EOL
  JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/"
  JRE_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"
EOL

source /etc/environment

cd /home/ubuntu

wget http://ftp.unicamp.br/pub/apache//jmeter/binaries/apache-jmeter-4.0.tgz

tar -zxf apache-jmeter-4.0.tgz

cat >> genre.txt <<EOF
Masculino
Feminino
EOF

wget https://gist.githubusercontent.com/JoaoManoel/bb5c14659412754d722ec7dd074162df/raw/91c7470a254a9f4a805c88c5e43cab0cc4dd94b8/TestPlan.jmx
#./apache-jmeter-4.0/bin/jmeter -n


