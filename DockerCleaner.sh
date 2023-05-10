#!/bin/sh

# #stop and remove all of the containers on your system
# docker ps -aq | xargs docker stop | xargs docker rm

# #remove all docker volumes
# docker system prune 
# docker system prune -a --volumes 

# #remove all images
# docker image rm $(docker images -aq)

    docker stop $(docker ps -q)
	docker rm $(docker ps -qa)
	docker network prune -f
	docker image prune -f
	rm -rf /home/fech-cha/data/mariadb/*
	rm -rf /home/fech-cha/data/wordpress/*