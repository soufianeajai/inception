#!/bin/sh

mkdir -p /var/run/mysqld /var/lib/mysql
chown -R mysql:mysql /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql
set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    /usr/bin/mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

mysqld --user=mysql --bootstrap <<EOSQL
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';
CREATE DATABASE IF NOT EXISTS \`wordpress\`;
CREATE USER IF NOT EXISTS 'sajaite'@'%' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON \`wordpress\`.* TO 'sajaite'@'%';
FLUSH PRIVILEGES;
EOSQL

echo "MySQL initialization script completed successfully..."

mysqld --user=mysql --console

echo "MySQL started successfully..."
