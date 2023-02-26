# 42_Inception
A docker platform inside a virtual machine inside my computer

# Docker Knowledge

# Project Architecture 
# Order:
MariaDB -> Wordpress -> Nginx

# Stacks knowledge
# #nginx (web-server: get a request => send response)
      (Gateway)
internet <=> Back-end infrastructure 
*event driven architecture
*Reverse proxy: Distribute the load to multiple back-end servers (+security, caching, SSL(TLS) encryption)
*using Linux server (conf file in /etc)
*customize the server by defining directives (key-value pair, or followed by {} => context)
*one of Nginx roles is to serve static content like images and HTML files 
*define server directives where you can specify which ports to listen to 
*directive of "Location" of where to find the raw files 
*include SSL configuration  

