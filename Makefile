DOCKER_COMPOSE := docker compose


all : up

up:
	mkdir -p /home/fech-cha/data/mariadb
	mkdir -p /home/fech-cha/data/wordpress

	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml up -d

down:
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml down

start:
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml start

stop:
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml stop

status:
	@docker ps

logs:
	$(DOCKER_COMPOSE) logs -f $(CONTAINER_NAME)

fclean: 
	docker stop $(docker ps -q)
	docker rm $(docker ps -qa)
	docker system prune -f  -a --volumes
	docker network prune -f
	docker image prune -f
	rm -rf /home/fech-cha/data/mariadb/*
	rm -rf /home/fech-cha/data/wordpress/*

.PHONY: up down start stop status fclean