# Wordpress CONFIG
cd
mkdir -p /var/www/localhost/
cp /root/wordpress.tar.gz /var/www/localhost/
cd /var/www/localhost/
tar -xf wordpress.tar.gz
rm wordpress.tar.gz
cd
mv /root/wp-config.php /var/www/localhost/wordpress/
mkdir -p /run/php/


# php CONFIG
tar -C /var/www/localhost/ -xvzf /root/phpMyAdmin-5.0.4-english.tar.gz --overwrite
cd
mv /var/www/localhost/phpMyAdmin-5.0.4-english /var/www/localhost/phpmyadmin
mv /root/config.inc.php /var/www/localhost/phpmyadmin/
chown -R www-data:www-data /var/www/localhost/phpmyadmin
chmod 660 /var/www/localhost/phpmyadmin/config.inc.php

sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/pool.d/www.conf
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf


#/usr/sbin/$(ls /usr/sbin | grep php | grep fpm) --nodaemonize