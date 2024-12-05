FROM alpine:3.19

RUN apk update && apk add --no-cache mariadb

RUN mkdir -p /var/lib/mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY tools/setup.sh /setup.sh

RUN chmod +x /setup.sh
RUN chown -R mysql:mysql /setup.sh
EXPOSE 3306

ENTRYPOINT ["/setup.sh"]
