#!/bin/sh

  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp

  cd /var/www/html

  sed -i 's/listen = 127.0.0.1:9000/listen = wordpress:9000/g' /etc/php82/php-fpm.d/www.conf
if [ ! -f /var/www/html/wp-config.php ]; then
  wp core download --locale=en_US

  wp config create --dbhost="${WP_DB_HOST}" --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --extra-php << EOF
define( 'WP_REDIS_HOST', '${REDIS_HOST}' );
EOF

  wp core install \--url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_USR}" --admin_password="${WP_ADMIN_PWD}" --admin_email="${WP_ADMIN_EMAIL}" --skip-email

  wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=author --user_pass="${WP_USER_PWD}"

  wp plugin install redis-cache --activate --allow-root

  wp redis enable --allow-root
else
  echo "WordPress already installed. Skipping installation steps."

  wp redis enable --allow-root
fi

chown -R nobody:nobody /var/www

exec /usr/sbin/php-fpm82 -F
