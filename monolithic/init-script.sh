#!/bin/bash

echo "Installing MongoDB"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list

echo "Installing NodeJS"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

apt-get update -y 

apt-get install -y postgresql postgresql-contrib mongodb-org nodejs

systemctl start mongod
systemctl enable mongod

su postgres -c "createdb this_socks;"

cd /home/ubuntu/

curl https://gist.githubusercontent.com/JoaoManoel/103a467f7a7ac99a4e9eef4ea097536b/raw/e0ce0b72fa4621955b66d012ffd02a9d5fa015f9/this_socks_dump.sql > this_socks_dump.sql

psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    CREATE USER $DB_USER;
    CREATE DATABASE $DB_NAME;
    GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOSQL
