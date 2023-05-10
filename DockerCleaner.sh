#!/bin/sh

#stop and remove all of the containers on your system
$ docker ps -aq | xargs docker stop | xargs docker rm

#remove all docker volumes
docker system prune -a --volumes

#remove all images
docker image rm $(docker images -aq)