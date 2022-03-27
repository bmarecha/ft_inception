FROM debian:buster
MAINTAINER bmarecha <bmarecha@student.42.fr>

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install nginx
RUN apt-get -y install openssl wget

COPY conf/nginx-host-conf ./root/
COPY tools/info.php ./root/
COPY tools/startng.sh /

EXPOSE 443
CMD bash /startng.sh

ENTRYPOINT	/usr/sbin/nginx -g "daemon off;"