#!/bin/sh


#  openssl dhparam -out /etc/nginx/dhparam.pem 2048 && \
#     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt \
#     -subj "/C=MA/ST=None/L=Khouribga/O=42Network/OU=1337Kh/CN=fech-cha.42.fr" && \
#     openssl ecparam -genkey -name secp384r1 -out /etc/nginx/eckey.pem && \
#     openssl req -new -x509 -sha256 -key /etc/nginx/eckey.pem -out /etc/nginx/eccert.pem -days 365 -subj "/C=MA/ST=None/L=Khouribga/O=42Network/OU=1337Kh/CN=fech-cha.42.fr"




openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=fech-cha.42.ma"

addgroup -g 82 -S www-data 
adduser -u 82 -D -S -G www-data www-data

chown -R www-data:www-data /var/www/html
chmod -R 0777 /var/www/html

nginx -g "daemon off;"