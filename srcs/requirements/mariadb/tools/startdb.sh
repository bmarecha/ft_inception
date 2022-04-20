# Mariadb CONFIG
chown -R mysql /var/lib/mysql

sed -i "s/bind-ad/\#bind-ad/" "/etc/mysql/mariadb.conf.d/50-server.cnf"
sed -i "s/\#port   /port    /" "/etc/mysql/mariadb.conf.d/50-server.cnf"

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root
echo "CREATE USER IF NOT EXISTS 'control'@'%' IDENTIFIED BY 'control';" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_UPASS';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" | mysql -u root
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASS'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root -p$ROOT_PASS

if [ -d "/var/lib/mysql/wordpress" ]; then
echo "Wordpress db already made"
else
mysql wordpress -u root -p$ROOT_PASS < /root/wordpress.sql
fi

cp /home/debian.cnf /etc/mysql/

service mysql stop

# /var/run/mysqld/mysqld.sock missing ?

/usr/bin/mysqld_safe