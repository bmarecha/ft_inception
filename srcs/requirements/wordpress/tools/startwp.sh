# Wordpress CONFIG
cd
cp /root/wordpress.tar.gz /var/www/localhost/
cd /var/www/localhost/
tar -xf wordpress.tar.gz
rm wordpress.tar.gz
cd
mv /root/wp-config.php /var/www/localhost/wordpress/

# php CONFIG
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
tar -C /var/www/localhost/ -xzf phpMyAdmin-5.0.4-english.tar.gz
cd
mv /var/www/localhost/phpMyAdmin-5.0.4-english /var/www/localhost/phpmyadmin
mv /root/config.inc.php var/www/localhost/phpmyadmin
chmod 660 /var/www/localhost/phpmyadmin/config.inc.php
chown -R www-data:www-data /var/www/localhost/phpmyadmin

service php7.3-fpm start
