FROM alpine:3.19

RUN apk update && apk add --no-cache redis

COPY tools/redis-setup.sh /redis-setup.sh

RUN chmod +x /redis-setup.sh

EXPOSE 6379

CMD ["/redis-setup.sh"]