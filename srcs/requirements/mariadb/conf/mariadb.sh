touch ext
chmod 777 ext
echo "CREATE DATABASE IF NOT EXISTS wordpress;" >> ext
echo "FLUSH PRIVILEGES;" >> ext
echo "GRANT ALL ON *.* TO '$SQL_ROOT_USER'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD' WITH GRANT OPTION;" >> ext
echo "FLUSH PRIVILEGES;" >> ext
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> ext
echo "GRANT ALL ON wordpress.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"  >> ext
echo "FLUSH PRIVILEGES;" >> ext
mysqld --user=mysql --verbose --bootstrap < ext
rm ext
exec mysqld