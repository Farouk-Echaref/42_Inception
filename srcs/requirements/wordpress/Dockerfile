#Wordpress Dockerfile

# FROM debian:bullseye
FROM debian:buster

WORKDIR /var/www/html

RUN apt update & apt install -y php7.3 php-mysqli mariadb-client php-fpm wget

#Set ownership and permissions for wordpress files


COPY ./tools/wpScript.sh .

RUN 777 ./wpScript.sh

# COPY    

EXPOSE 9000

CMD ["./wpScript.sh"]