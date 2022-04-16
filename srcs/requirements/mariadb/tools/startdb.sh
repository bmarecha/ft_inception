# Mariadb CONFIG
chown -R mysql /var/lib/mysql

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_UPASS';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_UPASS';" | mysql -u root
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASS'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root -p$ROOT_PASS

mysql wordpress -u root -p$ROOT_PASS < /root/wordpress.sql
cp /home/debian.cnf /etc/mysql/

service mysql stop

# /var/run/mysqld/mysqld.sock missing ?

/usr/bin/mysqld_safe