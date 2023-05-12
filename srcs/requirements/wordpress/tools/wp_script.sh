#!/bin/sh

#WP-CLI is available as a PHP Archive file (.phar). You can download it using either wget or curl commands:
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#You need to make this .phar file executable and move it to /usr/local/bin so that it can be run directly:
chmod 777 wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

#WP-CLI includes a command to download WordPress
wp core download --allow-root

# wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_ROOT_PASS --locale=ro_RO

# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

#set up the database credentials for our installation
wp --allow-root core config --dbhost=mariadb --dbname=wordpress --dbuser=fech-cha --dbpass=root
chmod 777 /var/www/html/wp-config.php


#install WordPress now, we need to run one last command, while configuring WP-CLI credentials
wp --allow-root core install --url=fech-cha.42.fr --title=inception --admin_user=fech-cha --admin_password=user --admin_email=farouk.echcharef@usmba.ac.ma

exec php-fpm7.3  -F -R