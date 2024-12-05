DOCKER_COMPOSE = docker-compose
PROJECT_NAME = inception

all: build up

build:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml -p $(PROJECT_NAME) build

up:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml -p $(PROJECT_NAME) up

down:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml -p $(PROJECT_NAME) down

restart: down up

clean:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml -p $(PROJECT_NAME) down -v --remove-orphans

logs:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml -p $(PROJECT_NAME) logs -f

ps:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml -p $(PROJECT_NAME) ps

fclean: down
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml -p $(PROJECT_NAME) down --rmi all -v --remove-orphans
	docker system prune -af
