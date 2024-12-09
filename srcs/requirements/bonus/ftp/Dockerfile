FROM alpine:3.19

RUN apk update && apk add --no-cache vsftpd

COPY tools/setup-ftp.sh /setup-ftp.sh

RUN chmod +x /setup-ftp.sh

EXPOSE 21 21100-21110

ENTRYPOINT ["/setup-ftp.sh"]