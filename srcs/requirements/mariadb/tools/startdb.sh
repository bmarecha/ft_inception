# Mariadb CONFIG
service mysql start
wp core download --allow-root
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'bmarecha.42.fr' IDENTIFIED BY 'root';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
mysql wordpress -u root --password=root< /root/wordpress.sql
echo "GRANT ALL ON *.* TO 'bapt'@'localhost' IDENTIFIED BY '123'" | mysql -u root -password=root
echo "FLUSH PRIVILEGES;" | mysql -u root -password=root
