DOCKER_COMPOSE := docker compose
DOCKER_COMPOSE_FILE=srcs/docker-compose.yml

all : up

up:
	mkdir -p /home/fech-cha/data/mariadb
	mkdir -p /home/fech-cha/data/wordpress

	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d --build

down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

build:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

status:
	@docker ps

fclean:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v
	sudo rm -rf /home/fech-cha/data/srcs_mariadb
	sudo rm -rf /home/fech-cha/data/srcs_wordpress

.PHONY: up down start stop status clean fclean