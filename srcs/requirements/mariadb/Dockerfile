FROM debian:bullseye

# Update system packages
RUN apt update -y; apt upgrade -y

# Install MariaDB
RUN apt install -y mariadb-server

# Allow any network to connect to MariaDB
# RUN sed -i 's/bind-address = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN sed -ie "s/#bind-address=0.0.0.0/bind-address=0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -ie "s/skip-networking/# skip-networking/g" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb.sh /

CMD [ "bash", "mariadb.sh" ]
