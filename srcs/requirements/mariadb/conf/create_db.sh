#!/bin/sh

#check if /var/lib/mysql/mysql exists, if not MySQL database has not been initialized yet

if [ ! -d "/var/lib/mysql/mysql" ]; then

#Sets the owner of the /var/lib/mysql directory and all its contents to the mysql user and group
        chown -R mysql:mysql /var/lib/mysql

        # init database
        mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm
fi

#check if wordpress DB laready exist,if not create new one
if [ ! -d "/var/lib/mysql/wordpress" ]; then

    #redirect the output of the following text block to the file
        cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM     mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
CREATE DATABASE wordpress CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'fech-cha'@'%' IDENTIFIED by 'user';
GRANT ALL PRIVILEGES ON wordpress.* TO 'fech-cha'@'%';
FLUSH PRIVILEGES;
EOF
        /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
        rm -f /tmp/create_db.sql
fi