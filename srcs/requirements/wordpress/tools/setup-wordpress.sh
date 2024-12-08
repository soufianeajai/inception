#!/bin/sh
set -e
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

sed -i 's/listen = 127.0.0.1:9000/listen = wordpress:9000/g' /etc/php82/php-fpm.d/www.conf

wp core download  --locale=en_US > /dev/null 2>&1

    wp config create --dbhost="${WP_DB_HOST}" --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --extra-php << end
define( 'WP_REDIS_HOST', '${REDIS_HOST}' );
end


wp core install --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_USR}" --admin_password="${WP_ADMIN_PWD}" --admin_email="${WP_ADMIN_EMAIL}" --skip-email  > /dev/null 2>&1

wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=author --user_pass="${WP_USER_PWD}" 


wp plugin install redis-cache --activate --allow-root

wp redis enable --allow-root   when i add this line it gives me an error : Error establishing a Redis connection
chown -R nobody:nogroup /var/www
# wc redis status in path var/www/html gives me : Satatus : connected
exec /usr/sbin/php-fpm82 -F
