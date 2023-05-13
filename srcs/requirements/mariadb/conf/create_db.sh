#!/bin/sh

#check if /var/lib/mysql/mysql exists, if not MySQL database has not been initialized yet

if [ ! -d "/var/lib/mysql/mysql" ]; then

#Sets the owner of the /var/lib/mysql directory and all its contents to the mysql user and group
        chown -R mysql:mysql /var/lib/mysql
        chmod -R 777 /var/lib/mysql

        # init database
        # mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm
        mariadb-install-db --user=root --basedir=/usr --datadir=/var/lib/mysql \
		--rpm --auth-root-authentication-method=normal \
		--skip-test-db \
		--default-time-zone=SYSTEM --enforce-storage-engine= \
		--skip-log-bin \
		--expire-logs-days=0 \
		--loose-innodb_buffer_pool_load_at_startup=0 \
		--loose-innodb_buffer_pool_dump_at_shutdown=0

fi

SQL1="CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
SQL2="CREATE USER IF NOT EXISTS '${DB_USER}'@'${DB_HOST}' IDENTIFIED BY '${DB_USER_PASS}';"
SQL3="GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'${DB_HOST}';"
SQL4="FLUSH PRIVILEGES;"

#check if wordpress DB laready exist,if not create new one
# if [ ! -d "/var/lib/mysql/wordpress" ]; then

        /usr/bin/mysqld --user=root & #--bootstrap < /tmp/create_db.sql
        MY_SQL_PID=$!
        # until mariadb -u mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}" 2>&1 > /dev/null
        # do
        #         echo "Not Connected!"
                sleep 4
        # done
        #redirect the output of the following text block to the file
#         cat << EOF > /tmp/create_db.sql
# CREATE DATABASE IF NOT EXISTS ${DB_NAME};
# CREATE USER IF NOT EXISTS '${DB_USER}'@'${DB_HOST}' IDENTIFIED BY '${DB_USER_PASS}';
# GRANT ALL PRIVILEGES ON '${DB_NAME}'.* TO '${DB_USER}'@'${DB_HOST}';
# FLUSH PRIVILEGES;
# EOF

echo "$SQL1" > /tmp/create_db.sql
echo "$SQL2" >> /tmp/create_db.sql
echo "$SQL3" >> /tmp/create_db.sql
echo "$SQL4" >> /tmp/create_db.sql

mysql -u root < /tmp/create_db.sql
wait $MY_SQL_PID
# fi