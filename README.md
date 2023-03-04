# 42_Inception
A docker platform inside a virtual machine inside my computer

# Docker Knowledge

# Project Architecture 

## docker-compose
- need to set a network ip range

# Order:
MariaDB -> Wordpress -> Nginx

# Stacks knowledge

## maridadb (database: with SQL)

-manipulate databases
-concerning 50-server.cnf config file (especially bind address)
-If you want to allow other containers on the same Docker network to access the MariaDB server, you should set bind-address to the IP address of the Docker network interface, which is typically in the range 172.17.0.0/16. For example, you could set bind-address to 172.17.0.2 if that is the IP address of the Docker container running the MariaDB server. This would allow other containers on the same Docker network to access the MariaDB server using that IP address.

-Create database, Password root, Create User, set Password, grant privileges to user, flush privileges

## #nginx (web-server: get a request => send response)
      (Gateway)
*internet <=> Back-end infrastructure 
*event driven architecture
*Reverse proxy: Distribute the load to multiple back-end servers (+security, caching, SSL(TLS) encryption)
*using Linux server (conf file in /etc)
*customize the server by defining directives (key-value pair, or inside  {} => context)
*one of Nginx roles is to serve static content like images and HTML files 
*define server directives where you can specify which ports to listen to 
*directive of "Location" of where to find the raw files 
*include SSL configuration 


