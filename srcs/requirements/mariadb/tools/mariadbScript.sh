#/bin/sh

#start the service of mariadb
systemctl start mariadb
systemctl enable mariadb

#secure the mariadb installation
mysql_secure_installation <<EOF
y
rootPassword
rootPassword
y
y
y
y
y
EOF

#create database, user and password, grant privileges, flush privileges






