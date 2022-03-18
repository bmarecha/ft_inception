mkdir Test
# NGINX CONFIG
cd
mkdir -p /var/www/localhost
cp /root/info.php /var/www/localhost/
cp /root/nginx-host-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
echo "export indexon=1"

# Mariadb CONFIG
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'root';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

# Wordpress CONFIG
cd
cp /root/wordpress.tar.gz /var/www/localhost/
cd /var/www/localhost/
tar -xf wordpress.tar.gz
rm wordpress.tar.gz
cd
mv /root/wp-config.php /var/www/localhost/wordpress/
mysql wordpress -u root --password=root< /root/wordpress.sql

# php CONFIG
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
tar -C /var/www/localhost/ -xzf phpMyAdmin-5.0.4-english.tar.gz
cd
mv /var/www/localhost/phpMyAdmin-5.0.4-english /var/www/localhost/phpmyadmin
mv /root/config.inc.php var/www/localhost/phpmyadmin
chmod 660 /var/www/localhost/phpmyadmin/config.inc.php
chown -R www-data:www-data /var/www/localhost/phpmyadmin
echo "GRANT ALL ON *.* TO 'bapt'@'localhost' IDENTIFIED BY '123'" | mysql -u root -password=root
echo "FLUSH PRIVILEGES;" | mysql -u root -password=root

# SSL CONFIG
mkdir /etc/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=bmar/CN=localhost"


#mkdir ~/mkcert && \
#  cd ~/mkcert && \
#  wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64 && \
#  mv mkcert-v1.1.2-linux-amd64 mkcert && \
#  chmod +x mkcert
#./mkcert -install
#./mkcert localhost

# sudo systemctl restart mysql
# starting service
#service mysql restart
service php7.3-fpm start
service nginx start

sleep infinity
