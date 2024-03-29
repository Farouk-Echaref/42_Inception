#! /bin/sh


sed -i 's/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf

if [ ! -f /var/www/html/wp-config.php ]; then
    #WP-CLI is available as a PHP Archive file (.phar). You can download it using either wget or curl commands:
   curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    #You need to make this .phar file executable and move it to /usr/local/bin so that it can be run directly:
    chmod 777 wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    #change to the working directory
    cd /var/www/html

    #WP-CLI includes a command to download WordPress
    wp core download --allow-root
    cp wp-config-sample.php wp-config.php

    #set permissions for the wp-config.php
    chmod 777 /var/www/html/wp-config.php

    #set up the database credentials for our installation
    wp config set DB_NAME $DB_NAME --allow-root
	wp config set DB_USER $DB_USER --allow-root
	wp config set DB_PASSWORD $DB_USER_PASS --allow-root
	wp config set DB_HOST $DB_HOST --allow-root


    wp config set WP_REDIS_HOST 'redis' --allow-root
	wp config set WP_REDIS_PORT '6379' --allow-root
	wp config set WP_CACHE 'true' --allow-root


    #install WordPress now, we need to run one last command, while configuring WP-CLI credentials
    wp core install --url=$DOMAIN --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_EMAIL --allow-root
    wp user create $USR $USER_EMAIL --user_pass=$USER_PASSWORD --allow-root

    #set up the redis plugin
    wp plugin install redis-cache --activate --allow-root
    wp --allow-root redis enable

    chown -R www-data:www-data /var/www/html/

fi

exec "$@"