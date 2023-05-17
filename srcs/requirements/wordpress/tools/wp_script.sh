#! /bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then
    #WP-CLI is available as a PHP Archive file (.phar). You can download it using either wget or curl commands:
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    #You need to make this .phar file executable and move it to /usr/local/bin so that it can be run directly:
    chmod 777 wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    cd /var/www/html

    #WP-CLI includes a command to download WordPress
    wp --allow-root core download 
    cp wp-config-sample.php wp-config.php


    #set up the database credentials for our installation
    wp config set DB_NAME $DB_NAME --allow-root
	wp config set DB_USER $DB_USER --allow-root
	wp config set DB_PASSWORD $DB_USER_PASS --allow-root
	wp config set DB_HOST $DB_HOST --allow-root

    #set permissions for the wp-config.php
    chmod 777 /var/www/html/wp-config.php

    #install WordPress now, we need to run one last command, while configuring WP-CLI credentials
    wp core install --url=$DOMAIN --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_EMAIL --allow-root
    wp user create $USR $USER_EMAIL --user_pass=$USER_PASSWORD --allow-root

    wp theme install twentytweenty --activate --allow-root

fi

exec php-fpm7.3  -F -R