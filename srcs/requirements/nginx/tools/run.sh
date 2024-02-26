#!/bin/sh

mkdir -p $WP_PATH
chown -R www-data $WP_PATH

curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
chmod +x mkcert-v*-linux-amd64
cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert

mkcert mibernar.42.fr
cp mibernar.42.fr* /etc/nginx/ssl/

sed -i 's|DOMAIN_NAME|'${DOMAIN_NAME}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|WP_PATH|'${WP_PATH}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|PHP_HOST|'${PHP_HOST}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|CERTS_KEY|'${CERTS_KEY}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|CERTS_CRT|'${CERTS_CRT}'|g' /etc/nginx/sites-available/default.conf

nginx -g "daemon off;"
