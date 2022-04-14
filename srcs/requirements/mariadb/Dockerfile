FROM debian:buster
MAINTAINER bmarecha <bmarecha@student.42.fr>

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install mariadb-server php-mysql

RUN		mkdir -p /var/run/mysqld/
RUN		chmod -R 755 /var/run/mysqld/
RUN		chown -R mysql /var/run/mysqld
RUN		chmod -R 755 /var/lib/
RUN		chown -R mysql /var/lib
RUN		chown -R mysql /var/lib/mysql
RUN		chmod -R 755 /tmp
RUN		chown -R mysql /tmp
RUN     mysql_install_db

COPY tools/wordpress.sql ./root/
COPY tools/startdb.sh /
COPY tools/my.cnf /etc/mysql/

EXPOSE 3306

CMD bash /startdb.sh