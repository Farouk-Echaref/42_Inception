#!/bin/sh

#start the service of mariadb
systemctl start mariadb
systemctl enable mariadb

#secure the mariadb installation
mysql_secure_installation <<EOF
y
root
root
y
y
y
y
EOF

#create database, user and password, grant privileges, flush privileges
# % character is a wildcard that matches any hostname or IP address
mysql -u root -proot <<EOF
CREATE DATABASE mydb;
CREATE USER 'fech-cha'@'198.168.1.2' IDENTIFIED BY 'fech-cha';
GRANT ALL PRIVILEGES ON mydb.* TO 'fech-cha'@'198.168.1.2';
FLUSH PRIVILEGES;
EOF

#start the mariaDB server
# /usr/bin/mysqld_safe

systemctl start mariadb.service

# kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld





