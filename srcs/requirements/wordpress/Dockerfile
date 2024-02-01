FROM debian:bullseye

# Update system packages
RUN apt update -y; apt upgrade -y

# Install wget
RUN apt install -y wget

# Instakk php and php-fpm
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

# Download WordPress folder
RUN wget https://pt.wordpress.org/latest-pt_PT.tar.gz -P /var/www

# De-tar and decompress WordPress folder
RUN cd /var/www && tar -xzf latest-pt_PT.tar.gz && rm latest-pt_PT.tar.gz

# Give root permissions to write this folder
RUN chown -R root:root /var/www/wordpress

# Install CLI (Command Line Interface)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Give CLI rights and move it into the binaries
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

