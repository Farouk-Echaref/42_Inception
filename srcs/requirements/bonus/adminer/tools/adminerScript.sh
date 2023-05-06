#!/bin/sh 

#download the Adminer installation file from their official website, save the php file in /var/www/html
wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php 

#change the permission of the downloaded file
chown -R www-data:www-data /var/www/html/adminer.php 
chmod 777 /var/www/html/adminer.php


cd /var/www/html

rm -rf index.html
php -S 0.0.0.0:1234 adminer.php