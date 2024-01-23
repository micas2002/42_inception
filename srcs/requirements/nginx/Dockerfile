FROM debian:bullseye

# Install basic dependencies
RUN apt-get update
RUN apt-get install nano -y
RUN apt-get install curl -y

# incstall nginx
RUN apt-get install nginx -y

RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=PT/ST=Lisboa/L=Lisbon/O=42/OU=42/CN=mibernar.42.fr/UID=mibernar"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]