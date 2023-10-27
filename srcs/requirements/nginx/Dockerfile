FROM debian:buster

RUN apt-get update -y && apt upgrade -y \
    && apt-get install -y build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev openssl wget nginx

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=42/CN=[ajeanne.42.fr]/UID=ajeanne"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html && chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]