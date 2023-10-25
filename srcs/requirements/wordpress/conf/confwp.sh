set -x
sleep 10

if ! wp core is-installed --allow-root  ; then
	wp core download --allow-root --force
	wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --allow-root --force
	wp core install --url="ajeanne.42.fr" --title="Inception" --admin_user=$WORDPRESS_DB_ADMIN_USER --admin_password=$WORDPRESS_DB_ADMIN_PASSWORD --admin_email="radmin@student.42.fr" --allow-root
	wp user create $WORDPRESS_DB_USER ajeanne@student.42.fr --role=author --user_pass=$WORDPRESS_DB_PASSWORD --allow-root
	wp config shuffle-salts --allow-root
fi
if wp core is-installed --allow-root  ; then
    echo "Wordpress is installed and running"
    php-fpm7.3 -F -R
else
    echo "Wordpress's installation failed"
fi