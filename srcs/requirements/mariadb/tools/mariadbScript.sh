#!/bin/sh

#start the service of mariadb
systemctl start mariadb
systemctl enable mariadb

#secure the mariadb installation
mysql_secure_installation <<EOF
y
$(DB_ROOT_PASS)
$(DB_ROOT_PASS)
y
y
y
y
EOF

#create database, user and password, grant privileges, flush privileges
# % character is a wildcard that matches any hostname or IP address
mysql -u root -p$(DB_ROOT_PASS) <<EOF
CREATE DATABASE $(DB_NAME);
CREATE USER '$(DB_USER)'@'localhost' IDENTIFIED BY '$(DB_USER_PASS)';
GRANT ALL PRIVILEGES ON *.* TO '$(DB_USER)'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

#start the mariaDB server
# /usr/bin/mysqld_safe

systemctl start mariadb.service

# kill $(cat /var/run/mysqld/mysqld.pid)
# mysqld





