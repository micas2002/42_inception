#!/bin/bash

# Start MySQL
service mysql start;

# Create database table, if it does not already exists
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create user, if it does not already exists, that can manioulate the database table
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Give user all rights
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Refresh MySQL
mysql -e "FLUSH PRIVILEGES;"

# Restart MySQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe
