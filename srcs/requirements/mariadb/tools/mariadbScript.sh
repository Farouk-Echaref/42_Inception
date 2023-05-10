#!/bin/sh

#start the service of mariadb
# systemctl start mariadb
# systemctl enable mariadb

#secure the mariadb installation
# mysql_secure_installation <<EOF
# y
# $(DB_ROOT_PASS)
# $(DB_ROOT_PASS)
# y
# y
# y
# y
# EOF

#create database, user and password, grant privileges, flush privileges
# % character is a wildcard that matches any hostname or IP address
# mysql -u root -p$(DB_ROOT_PASS) <<EOF
# CREATE DATABASE $(DB_NAME);
# CREATE USER '$(DB_USER)'@'localhost' IDENTIFIED BY '$(DB_USER_PASS)';
# GRANT ALL PRIVILEGES ON *.* TO '$(DB_USER)'@'localhost' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
# EOF

#start the mariaDB server
# /usr/bin/mysqld_safe

# systemctl start mariadb.service

# kill $(cat /var/run/mysqld/mysqld.pid)
# mysqld

# Create the "mysql" group
addgroup mysql mysql

# Create the "/var/run/mysqld" directory
mkdir -p /run/mysqld
chmod 777 /run/mysqld

# Set the ownership of "/var/run/mysqld" to the "mysql" user and group
chown -R mysql:mysql /run/mysqld

# Set the ownership of "/var/lib/mysql" to the "mysql" user and group
chown -R mysql:mysql /var/lib/mysql

# Initialize the MariaDB database
mysql_install_db --user=mysql --ldata=/var/lib/mysql


#Configuring the MySQL Database

cat <<E >temp
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' identified by '$DB_ROOT_PASS' WITH GRANT OPTION ;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' identified by '$DB_ROOT_PASS' WITH GRANT OPTION ;

SET PASSWORD FOR 'root'@'localhost'=PASSWORD('$DB_ROOT_PASS') ;
DROP DATABASE IF EXISTS test ;
CREATE DATABASE wordpress;
FLUSH PRIVILEGES ;

GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' identified by '$DB_USER_PASS' WITH GRANT OPTION ;
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'localhost' identified by '$DB_USER_PASS' WITH GRANT OPTION ;
SET PASSWORD FOR '$DB_USER'@'localhost'=PASSORD('$DB_USER_PASS') ;
FLUSH PRIVILEGES ;
E

mysqld --user=mysql --bootstrap --datadir=/var/lib/mysql < temp

rm -rf temp

mysqld --user=mysql --console --skip-networking=0









