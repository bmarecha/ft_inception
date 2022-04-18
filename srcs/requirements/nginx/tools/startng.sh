# NGINX CONFIG
cd

mkdir -p /var/www/localhost
cp /root/info.php /var/www/localhost/
cp /root/nginx-host-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

# SSL CONFIG
mkdir /etc/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=bmar/CN=bmarecha.42.fr"