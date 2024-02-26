FROM debian:bullseye

RUN apt-get update -y && apt-get update -y && \
	apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chown -R mysql:mysql /etc/mysql/

COPY ./tools/run.sh /tmp/
COPY ./conf/init.sql /tmp/
COPY ./conf/my.cnf /etc/mysql

RUN chown -R mysql:mysql /tmp/ && \
	chown -R mysql:mysql /etc/mysql

EXPOSE  3306

USER mysql

ENTRYPOINT ["sh", "/tmp/run.sh"]
