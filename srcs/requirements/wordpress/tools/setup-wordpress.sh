#!/bin/sh

# Check if WordPress is already installed

  echo "WordPress not found. Proceeding with installation..."

  # Download wp-cli.phar
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp

  # Change to the WordPress root directory
  cd /var/www/html

  # Update PHP-FPM configuration
  sed -i 's/listen = 127.0.0.1:9000/listen = wordpress:9000/g' /etc/php82/php-fpm.d/www.conf
if [ ! -f /var/www/html/wp-config.php ]; then
  # Download WordPress core files
  wp core download --locale=en_US

  # Create wp-config.php
  wp config create --dbhost="${WP_DB_HOST}" --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --extra-php << EOF
define( 'WP_REDIS_HOST', '${REDIS_HOST}' );
EOF

  # Install WordPress
  wp core install \
    --url="${DOMAIN_NAME}" \
    --title="${WP_TITLE}" \
    --admin_user="${WP_ADMIN_USR}" \
    --admin_password="${WP_ADMIN_PWD}" \
    --admin_email="${WP_ADMIN_EMAIL}" \
    --skip-email

  # Create an additional WordPress user
  wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=author --user_pass="${WP_USER_PWD}"

  # Install and activate Redis Cache plugin
  wp plugin install redis-cache --activate --allow-root

  # Enable Redis cache
  wp redis enable --allow-root
else
  echo "WordPress already installed. Skipping installation steps."

  # Ensure Redis is active
  wp redis enable --allow-root || true
fi

# Set the correct permissions
chown -R nobody:nobody /var/www

# Start PHP-FPM in foreground mode
exec /usr/sbin/php-fpm82 -F
