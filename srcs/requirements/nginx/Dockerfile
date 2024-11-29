FROM alpine:3.19

RUN apk update && apk add --no-cache \
    nginx \
    openssl \
    rm -rf /var/cache/apk/*

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY tools/generate_ssl.sh /usr/local/bin/generate_ssl.sh

RUN chmod +x /usr/local/bin/generate_ssl.sh

RUN /usr/local/bin/generate_ssl.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]


# try to use volumes instead of copying whenever it is possible