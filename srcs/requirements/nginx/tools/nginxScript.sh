#!/bin/sh

    openssl dhparam -out /etc/nginx/dhparam.pem 2048 && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt \
    -subj "/C=MA/ST=None/L=Khouribga/O=42Network/OU=1337Kh/CN=fech-cha.42.fr" && \
    openssl ecparam -genkey -name secp384r1 -out /etc/nginx/eckey.pem && \
    openssl req -new -x509 -sha256 -key /etc/nginx/eckey.pem -out /etc/nginx/eccert.pem -days 365 -subj "/C=MA/ST=None/L=Khouribga/O=42Network/OU=1337Kh/CN=fech-cha.42.fr"


nginx -g "daemon off;"