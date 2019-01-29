.PHONY: init build run

COMPOSE = docker-compose
DOCKER = docker

default: run

init:
	./scripts/init.sh

run: build
	$(COMPOSE) up -d

build:
	$(COMPOSE) build

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) restart

getadminkey:
	$(DOCKER) exec jenkins-docker_jenkins_1 cat /var/jenkins_home/secrets/initialAdminPassword
