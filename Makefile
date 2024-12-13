DOCKER_COMPOSE = docker-compose
PROJECT_NAME = inception
CMD = $(DOCKER_COMPOSE) -f srcs/docker-compose.yml -p $(PROJECT_NAME)
all: build up

build:
	$(CMD) build

up:
	$(CMD) up -d

down:
	$(CMD) down

clean:
	$(CMD) down -v

ps:
	$(CMD) ps

fclean: down
	$(CMD) down --rmi all -v
	docker system prune -af

