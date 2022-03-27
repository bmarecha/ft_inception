FROM debian:buster
MAINTAINER bmarecha <bmarecha@student.42.fr>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
RUN apt-get install -y php-mbstring php-zip php-gd
RUN apt-get install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
RUN apt-get -y install wget

COPY conf/wordpress.tar.gz ./root/
COPY conf/wp-config.php ./root/
COPY conf/config.inc.php ./root/
COPY tools/startwp.sh /

EXPOSE 3306
EXPOSE 9000
CMD bash /startwp.sh
