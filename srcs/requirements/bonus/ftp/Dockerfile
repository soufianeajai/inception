FROM alpine:3.19

RUN apk update && apk add --no-cache vsftpd

COPY tools/start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 21 21100-21110

ENTRYPOINT ["/start.sh"]