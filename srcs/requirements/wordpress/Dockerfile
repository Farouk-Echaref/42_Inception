#Wordpress Dockerfile

# FROM debian:bullseye
FROM debian:buster

ARG WP_USER \
    WP_PASS \
    WP_EMAIL \
    WP_TITLE \
    DB_HOST \
    DB_NAME \
    USR \
    USER_EMAIL \
    USER_PASSWORD

# RUN chmod -R 777 /var/www/html

RUN mkdir -p /run/php/

RUN apt update

RUN apt install -y php php-mysqli mariadb-client php7.3-fpm wget

COPY ./tools/wp_script.sh .

RUN chmod 777 ./wp_script.sh

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./conf/php.ini /etc/php/7.3/fpm

EXPOSE 9000

CMD ["sh", "./wp_script.sh"]