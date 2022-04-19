#!/bin/bash

cd /var/www/localhost
wp core download --allow-root

sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/pool.d/www.conf
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
if [ -d "/var/www/localhost/phpmyadmin/" ]; then
echo "phpmyadmin already installed."
else
tar -C /var/www/localhost/ -xzf /root/phpMyAdmin-5.0.4-english.tar.gz --overwrite
mv /var/www/localhost/phpMyAdmin-5.0.4-english /var/www/localhost/phpmyadmin
fi

chown -R www-data:www-data /var/www/localhost/phpmyadmin

cp /root/config.inc.php /var/www/localhost/phpmyadmin/config.inc.php
cp /root/wp-config.php /var/www/localhost/wp-config.php

sed -i "s|R_DB_NAME|'$DB_NAME'|g" /var/www/localhost/wp-config.php
sed -i "s|R_DB_USER|'$DB_USER'|g" /var/www/localhost/wp-config.php
sed -i "s|R_DB_PASSWORD|'$DB_UPASS'|g" /var/www/localhost/wp-config.php
sed -i "s|R_DB_HOST|'$DB_HOST'|g" /var/www/localhost/wp-config.php

cd /var/www/localhost
wp core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_NICK \
                                --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL

wp user create --allow-root $WP_ADMIN_NICK $WP_ADMIN_MAIL --user_pass=$WP_ADMIN_PASS --role=administrator
wp user create --allow-root bmarecha bmarecha@42.fr --user_pass=12345 --role=author


/usr/sbin/$(ls /usr/sbin | grep php | grep fpm) --nodaemonize