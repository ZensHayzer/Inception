FROM debian:buster

RUN apt-get update -y && apt upgrade -y \
    && apt-get install -y mariadb-server gettext-base

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/mariadb.sh /var/lib/mysql

RUN chown mysql:mysql /var/lib/mysql

EXPOSE 3306

CMD ["sh", "/var/mariadb.sh"]