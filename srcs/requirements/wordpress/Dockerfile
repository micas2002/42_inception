FROM debian:bullseye

# Update system packages
RUN apt update -y; apt upgrade -y

RUN apt install -y php-fpm php-mysql curl

COPY ./tools/wordpress.sh /
COPY ./tools/wp-config.php /

CMD [ "bash", "wordpress.sh" ]