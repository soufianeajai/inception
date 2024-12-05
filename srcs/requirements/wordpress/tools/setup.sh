#!/bin/sh

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html/wordpress

mkdir -p /run/php

sed -i 's/;clear_env = no/clear_env = no/g' /etc/php83/php-fpm.d/www.conf

wp core download --allow-root --locale=en_US 

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp plugin install redis-cache --activate --allow-root

wp redis enable --allow-root

wp plugin update --all --allow-root

chown -R www-data:www-data /var/www/html

/usr/sbin/php-fpm83