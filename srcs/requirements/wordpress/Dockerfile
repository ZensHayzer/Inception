FROM debian:buster

RUN apt-get update -y && apt upgrade -y \
    && apt-get -y install wget php7.3 php-fpm php-mysql mariadb-client bash

RUN	wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www

RUN	cd /var/www && tar -xzf wordpress-6.2-fr_FR.tar.gz && rm wordpress-6.2-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN chmod 755 /var/www/wordpress

COPY conf/php.conf /etc/php7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php

RUN chmod 755 /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/confwp.sh /var/confwp.sh

RUN chmod 755 /var/confwp.sh

EXPOSE 9000

WORKDIR /var/www/wordpress

CMD ["bash", "/var/confwp.sh"]