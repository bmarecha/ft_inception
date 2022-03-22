FROM debian:buster
MAINTAINER bmarecha <bmarecha@student.42.fr>

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install mariadb-server

#COPY srcs/wordpress.tar.gz ./root/
COPY tools/wordpress.sql ./root/
COPY tools/startdb.sh /

EXPOSE 3306
CMD bash /startdb.sh
