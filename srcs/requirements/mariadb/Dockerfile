FROM alpine:3.18

# Upgrade system packages and install MariaDB
RUN apk -U upgrade && apk add --no-cache mariadb mariadb-client

# Configure MariaDB with mariadb.conf file
COPY /conf/mariadb.conf /etc/my.cnf.d/mariadb-server.cnf

# Copy script into container root
COPY /tools/mariadb.sh /
RUN chmod +x mariadb.sh
RUN chown -R 999:999 /var/lib/mysql

# Make container listen on port 3306
EXPOSE 3306

ENTRYPOINT [ "./mariadb.sh" ]