all: up

.PHONY: up
up:
	@mkdir -p root/data/mariadb
	@mkdir -p root/data/wordpress
	@docker-compose -f srcs/docker-compose.yml up --build

.PHONY: clean
clean: stop
	docker system prune -a -f --volumes

.PHONY: clear
clear: clean
	docker volume rm wordpress mariadb

.PHONY: stop
stop:
	docker-compose -f srcs/docker-compose.yml down

.PHONY: re
re: clean all

.PHONY: show
show:
	docker ps
	docker volume ls -q
	docker container ls -q

.PHONY: logs
logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx