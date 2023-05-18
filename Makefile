DOCKER_COMPOSE := docker compose
DOCKER_COMPOSE_FILE=srcs/docker-compose.yml

DB			= mariadb
WORDPRESS	= wordpress
NGINX		= nginx
REDIS		= redis
SFTP		= sftp
PORTFOLIO	= portfolio
ADMINER		= adminer
PORTAINER	= portainer


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

clean :
	docker stop $(NGINX) $(DB) $(WORDPRESS) $(REDIS) $(SFTP) $(PORTFOLIO) $(ADMINER) $(PORTAINER)

fclean: clean
	docker rm $(NGINX) $(DB) $(WORDPRESS) $(REDIS) $(SFTP) $(PORTFOLIO) $(ADMINER) $(PORTAINER)
	sudo rm -rf /home/fech-cha/data
aclean: fclean
	@docker volume rm srcs_mariadb
	@docker volume rm srcs_wordpress

.PHONY: up down start stop status 