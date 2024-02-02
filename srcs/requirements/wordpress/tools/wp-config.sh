#!/bin/bash

# Make sure MariaDB has time to lauch
sleep 10

# If wp-config.php does not already exists, setup WordPress
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'

mkdir /run/php

/usr/sbin/php-fpm7.3 -F