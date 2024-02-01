FROM debian:bullseye

# Update system packages
RUN apt update -y; apt upgrade -y

# Install NginX and OpenSSL
RUN apt install -y nginx openssl

# Create folder for ssl
RUN mkdir -p /etc/nginx/ssl

# Generate sll key and certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=PT/ST=LIS/L=Lisbon/O=42/OU=mibernar/CN=mibernar.42.fr"

# Create folder for nginx config files
RUN mkdir -p /var/run/nginx

COPY /conf/nginx.conf /etc/nginx/nginx.conf

# Give root and user all rights neeeded
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]