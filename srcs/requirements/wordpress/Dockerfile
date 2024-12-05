FROM alpine:3.19

RUN apk update && apk add --no-cache php php-fpm php-mysqli php-xml php-mbstring php-zip php-curl php-phar wget unzip

RUN mkdir -p /var/www/html/wordpress

COPY tools/setup.sh /setup.sh

COPY conf/wp-config.php /var/www/html/wordpress/wp-config.php

EXPOSE 9000

CMD ["/setup.sh"]
