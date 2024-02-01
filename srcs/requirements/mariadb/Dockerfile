FROM debian:bullseye

# Update system packages
RUN apt update -y; apt upgrade -y

# Install MariaDB
RUN apt install -y mariadb-server

COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.f/50-server.cnf

COPY /tools/mariadb.sh /

CMD ["bash", "./mariadb.sh"]