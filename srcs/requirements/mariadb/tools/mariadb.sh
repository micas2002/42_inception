#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then

	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

	mysqld -u mysql --bootstrap <<EOF
		flush privileges;
		create user '${MYSQL_USER}'@'%' identified by '${MYSQL_PASSWORD}';
		CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
		grant all on ${MYSQL_DATABASE}.* to '${MYSQL_USER}'@'%';
		delete from mysql.user where user='';
		delete from mysql.user where user='root';
		flush privileges;
EOF

fi

mysqld -u mysql