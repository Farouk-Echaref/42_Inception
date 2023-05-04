DOCKER_COMPOSE := docker compose
CONTAINER_NAME := my_container

.PHONY: up down start stop status

all : up

up:
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml up -d

down:
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml down

start:
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml start

stop:
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml stop

logs:
	$(DOCKER_COMPOSE) logs -f $(CONTAINER_NAME)
