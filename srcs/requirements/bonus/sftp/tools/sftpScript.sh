#!/bin/sh

#create root directory if it doesn't exist already 
mkdir -p /var/www/html

#create ftp user and set password
adduser $FTP_USER --disabled-password

echo "$FTP_USER:$FTP_PASSWD" | chpasswd

# set the ownership of the wordpress website files to FTP_USER
chown -R $FTP_USER:$FTP_USER /var/www/html/


#add user to ftp users list
echo $FTP_USER > /etc/vsftpd.users_list


#start the service
vsftpd /etc/vsftpd/vsftpd.conf