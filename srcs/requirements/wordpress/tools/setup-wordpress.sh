#!/bin/sh
set -e

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

sed -i 's/listen = 127.0.0.1:9000/listen = wordpress:9000/g' /etc/php82/php-fpm.d/www.conf

wp core download --allow-root --locale=en_US

wp config create --dbhost="${WP_DB_HOST}" --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --allow-root

wp core install --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_USR}" --admin_password="${WP_ADMIN_PWD}" --admin_email="${WP_ADMIN_EMAIL}" --skip-email --allow-root

wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=author --user_pass="${WP_USER_PWD}" --allow-root

chown -R nobody:nobody /var/www/html

exec /usr/sbin/php-fpm82 -F
