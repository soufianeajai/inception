FROM alpine:3.19

RUN apk update && apk upgrade && apk add mariadb mariadb-client
        
COPY tools/setup-mariadb.sh /setup-mariadb.sh

RUN chmod +x /setup-mariadb.sh

ENTRYPOINT ["/setup-mariadb.sh"]
