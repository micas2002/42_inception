#!/bin/sh

mkdir -p /var/www/wordpress
cd /var/www/wordpress

# Wait for MariaDB to start
while ! mysql -h mariadb -P 3306 -u ${MYSQL_USER} -p${MYSQL_PASSWORD} 2> /dev/null; do
sleep 1
done

wp core download --allow-root
wp core config --dbname=${MYSQL_DATABASE} \
                --dbuser=${MYSQL_USER} \
                --dbpass=${MYSQL_PASSWORD} \
                --dbhost=${DB_HOSTNAME}

wp core install --url=${URL} \
                --title=${TITLE} \
                --admin_user=${WP_ADMIN} \
                --admin_password=${WP_ADMIN_PASS} \
                --admin_email=${WP_ADMIN_EMAIL}

wp user create ${WP_USER} \
                ${WP_USER_EMAIL} \
                --user_pass=${WP_USER_PASS}

php-fpm81 -FO