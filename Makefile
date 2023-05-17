DOCKER_COMPOSE := docker compose
DOCKER_COMPOSE_FILE=./srcs/docker-compose.yml


all : up

up:
	mkdir -p /home/fech-cha/data/mariadb
	mkdir -p /home/fech-cha/data/wordpress

	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d 

down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

build:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

status:
	@docker ps

fclean: 
	docker stop $(docker ps -q) 2>/dev/null 
	docker rm $(docker ps -qa) 2>/dev/null 
	docker system prune -f  -a --volumes 2>/dev/null 
	docker network prune -f 2>/dev/null 
	docker image prune -f 2>/dev/null 
	docker image rm $(docker images -qa) 2>/dev/null 
	rm -rf /home/fech-cha/data/mariadb/* 2>/dev/null 
	rm -rf /home/fech-cha/data/wordpress/* 2>/dev/null 

.PHONY: up down start stop status fclean