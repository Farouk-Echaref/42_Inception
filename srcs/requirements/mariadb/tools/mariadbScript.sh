#!/bin/sh

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -u root -p"$DB_ROOT_PASS" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME";
mysql -u root -p"$DB_ROOT_PASS" -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS'" ;
mysql -u root -p"$DB_ROOT_PASS" -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" ;
mysql -u root -p"$DB_ROOT_PASS" -e "FLUSH PRIVILEGES;"

kill `cat /var/run/mysqld/mysqld.pid`

mysqld

#start the service of mariadb
# systemctl start mariadb
# systemctl enable mariadb

#secure the mariadb installation
# mysql_secure_installation <<EOF
# y
# "$DB_ROOT_PASS"
# "$DB_ROOT_PASS"
# y
# y
# y
# y
# EOF

#create database, user and password, grant privileges, flush privileges
# % character is a wildcard that matches any hostname or IP address
# mysql -u root -p"$DB_ROOT_PASS" <<EOF
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
# addgroup mysql mysql

# Create the "/var/run/mysqld" directory
# mkdir -p /run/mysqld
# chmod 777 /run/mysqld

# Set the ownership of "/var/run/mysqld" to the "mysql" user and group
# chown -R mysql:mysql /run/mysqld

# Set the ownership of "/var/lib/mysql" to the "mysql" user and group
# chown -R mysql:mysql /var/lib/mysql

# Initialize the MariaDB database
# mysql_install_db --user=mysql --ldata=/var/lib/mysql


#Configuring the MySQL Database

# cat <<E >temp
# USE mysql;
# FLUSH PRIVILEGES;
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' identified by 'root' WITH GRANT OPTION ;
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' identified by 'root' WITH GRANT OPTION ;

# SET PASSWORD FOR 'root'@'localhost'=PASSWORD('root') ;
# DROP DATABASE IF EXISTS test ;
# CREATE DATABASE wordpress;
# FLUSH PRIVILEGES ;

# GRANT ALL PRIVILEGES ON *.* TO 'fech-cha'@'%' identified by 'user' WITH GRANT OPTION ;
# GRANT ALL PRIVILEGES ON *.* TO 'fech-cha'@'localhost' identified by 'user' WITH GRANT OPTION ;
# SET PASSWORD FOR 'fech-cha'@'localhost'=PASSWORD('user') ;
# FLUSH PRIVILEGES ;
# E

# mysqld --user=mysql --bootstrap --datadir=/var/lib/mysql < temp

# rm -rf temp

# mysqld --user=mysql --console --skip-networking=0

#!/bin/bash









