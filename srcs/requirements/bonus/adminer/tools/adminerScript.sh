#!/bin/sh 

#download the Adminer installation file from their official website, save the php file in /var/www/html
wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php 

#change the permission of the downloaded file
chown -R www-data:www-data /var/www/html/adminer.php 
chmod 777 /var/www/html/adminer.php

#change to the working directory
cd /var/www/html

#remove the default index
rm -rf index.html

# starts a built-in web server that listens on port 1234 and serves the Adminer PHP file
php -S 0.0.0.0:1234 adminer.php