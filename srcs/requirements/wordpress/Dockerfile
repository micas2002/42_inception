FROM alpine:3.18

# Upgrade system packages and install php and php-fpm
RUN apk -U upgrade && apk add --no-cache curl php php-fpm

# Install Wordpress command-line interface
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# Setup Wordpress config with wordpress.conf file
COPY /conf/wordpress.conf /etc/php81/php-fpm.d/www.conf

# Copy Wordpress setup script into the root of the container
COPY /tools/wordpress.sh /
RUN chmod +x wordpress.sh

# Create user to handle Wordpress
RUN adduser -S wp-user

# Make container listen on port 9000
EXPOSE 9000

ENTRYPOINT [ "./wordpress.sh" ]