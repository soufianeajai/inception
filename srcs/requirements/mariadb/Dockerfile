FROM alpine:3.19

RUN apk update && apk add --no-cache mariadb

COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY setup.sh /setup.sh

RUN chmod +x /setup.sh

EXPOSE 3306

ENTRYPOINT ["/setup.sh"]
