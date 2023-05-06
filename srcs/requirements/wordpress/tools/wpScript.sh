#! /bin/sh

#WP-CLI is available as a PHP Archive file (.phar). You can download it using either wget or curl commands:
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#You need to make this .phar file executable and move it to /usr/local/bin so that it can be run directly:
chmod 755 wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

#WP-CLI includes a command to download WordPress
wp --allow-root core download 
#set up the database credentials for our installation
wp --allow-root core config --dbhost=$(DB_HOST) --dbname=$(DB_NAME) --dbuser=$(DB_USER) --dbpass=$(DB_ROOT_PASS)

chmod 777 /var/www/html/wp-config.php

#install WordPress now, we need to run one last command, while configuring WP-CLI credentials
wp --allow-root core install --url=$DOMAIN --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_EMAIL

#redis
# wp --allow-root plugin install redis-cache --activate

# sed -i "40i define( 'WP_REDIS_HOST', 'redis' );"			/var/www/html/wp-config.php
# sed -i "42i define( 'WP_REDIS_PASSWORD', '$REDISPASS' );"	/var/www/html/wp-config.php

# wp --allow-root redis enable

# chown -R www-data:www-data /var/www/html/

php-fpm7.3  -F 