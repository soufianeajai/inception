FROM debian:bullseye

# Install PHP 7.4 and necessary extensions
RUN apt-get update && apt-get install -y \
    php7.4-fpm php7.4-mysql php7.4-xml php7.4-mbstring php7.4-zip php7.4-curl \
    wget unzip && apt-get clean

# Configure PHP-FPM
RUN mkdir -p /run/php && \
    sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i 's/;clear_env = no/clear_env = no/g' /etc/php/7.4/fpm/pool.d/www.conf

# Create the necessary directory and download WordPress
RUN mkdir -p /var/www/html && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    rm latest.tar.gz

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

# Copy the wp-config.php file
COPY conf/wp-config.php /var/www/html/
RUN chown www-data:www-data /var/www/html/wp-config.php

# Expose port for PHP-FPM
EXPOSE 9000

# Start php-fpm service
CMD ["php-fpm7.4", "-F"]