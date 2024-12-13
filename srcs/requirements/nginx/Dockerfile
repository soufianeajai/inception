FROM alpine:3.19

RUN apk update && apk add --no-cache nginx openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY conf/default.conf /etc/nginx/conf.d/default.conf

COPY tools/generate_ssl.sh /usr/local/bin/generate_ssl.sh

RUN mkdir -p /var/www/html && chmod +x /usr/local/bin/generate_ssl.sh 
  
COPY tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
    
EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
