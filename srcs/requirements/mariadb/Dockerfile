FROM alpine:3.19

RUN apk update && apk add --no-cache mariadb && mkdir -p /etc/mysql/mariadb.conf.d /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql /etc/mysql

COPY conf/my.cnf /etc/mysql/my.cnf

COPY db_startup.sh /db_startup.sh

RUN chmod +x /db_startup.sh

EXPOSE 3306

ENTRYPOINT ["db_startup.sh"]

CMD ["mysqld"]
