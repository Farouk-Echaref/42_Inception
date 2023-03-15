#Wordpress Dockerfile

FROM debian:bulleye


#get required packages for PHP
RUN apt-get update && \
    apt-get install -y php-fpm php-mysql php-curl php-gd php-mbstring php-xml && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#download & install Wordpress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    mv wordpress /var/www/html

#Set ownership and permissions for wordpress files


COPY

EXPOSE 9000

CMD