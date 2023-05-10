DOCKER_COMPOSE := docker compose

.PHONY: up down start stop status fclean

all : up

up:
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
	$(sh ./DockerCleaner.sh)