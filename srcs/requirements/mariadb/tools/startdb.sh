# Mariadb CONFIG
chown -R mysql /var/lib/mysql

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root
echo "GRANT ALL ON *.* TO '$DB_USER'@'$DOMAIN_NAME' IDENTIFIED BY '$DB_UPASS' WITH GRANT OPTION;" | mysql -u root
echo "ALTER USER 'root'@'$DOMAIN_NAME' IDENTIFIED WITH mysql_native_password BY '$ROOT_PASS'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root -p$ROOT_PASS

mysql wordpress -u root -p$ROOT_PASS < /root/wordpress.sql

service mysql stop

# /var/run/mysqld/mysqld.sock missing ?

/usr/bin/mysqld_safe