FROM debian:bullseye

# Update system packages
RUN apt update -y; apt upgrade -y

RUN apt install -y php-fpm php-mysql curl

COPY /conf/wordpress.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY /tools/wordpress.sh /

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

USER www-data

ENTRYPOINT [ "sh", "/wordpress.sh" ]
