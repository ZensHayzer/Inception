FROM debian:bullseye

RUN apt-get update -y && apt upgrade -y \
    && apt-get install -y mariadb-server gettext-base

RUN mkdir -p /run/mysqld && chown mysql:root /run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/mariadb.sh /var/mariadb.sh

RUN chmod +x /var/mariadb.sh

EXPOSE 3306

CMD ["sh", "/var/mariadb.sh"]