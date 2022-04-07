# Mariadb CONFIG
service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'root'@'$DOMAIN_NAME' IDENTIFIED BY '$ROOT_PASS';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "GRANT ALL ON *.* TO '$DB_USER'@'$DOMAIN_NAME' IDENTIFIED BY '$DB_UPASS'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

mysql wordpress -u root < /root/wordpress.sql

service mysql stop

/usr/bin/mysqld_safe