DOCKER_COMPOSE = docker-compose
PROJECT_NAME = inception

all: build up

build:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) build

up:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) up -d

down:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) down

restart: down up

clean:
	down -v --remove-orphans

logs:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) logs -f

ps:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) ps
