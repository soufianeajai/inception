FROM alpine:3.19

RUN apk add --no-cache wget php82 php82-session php82-mysqli php82-pdo_mysql

WORKDIR /var/www/html

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O  adminer.php

EXPOSE 8080

CMD ["php", "-S", "adminer:8080", "adminer.php"]

