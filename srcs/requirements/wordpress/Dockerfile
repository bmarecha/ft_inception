FROM debian:buster
MAINTAINER bmarecha <bmarecha@student.42.fr>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
RUN apt-get install -y php-mbstring php-zip php-gd
RUN apt-get install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
RUN apt-get -y install wget
RUN		wget -P /usr/local/bin https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod -R 777 /usr/local/bin/wp-cli.phar
RUN		mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp
RUN		mkdir -p /var/www/localhost && mkdir -p /run/php
RUN     wget -P /root/ https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz


COPY conf/wp-config.php /root/wp-config.php
COPY conf/config.inc.php /root/
COPY tools/startwp.sh /

EXPOSE 9000
CMD bash /startwp.sh