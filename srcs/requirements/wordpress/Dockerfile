FROM alpine:3.19

RUN apk update && apk add --no-cache php php-fpm php-mysqli php-xml php-mbstring php-phar wget unzip

RUN mkdir -p /var/www/html

COPY tools/setup-wordpress.sh /setup-wordpress.sh

RUN chmod +x /setup-wordpress.sh

EXPOSE 9000

ENTRYPOINT ["/setup-wordpress.sh"]
