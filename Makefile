all:
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

ps:
	docker-compose -f srcs/docker-compose.yml ps

clean:
	docker system prune
	docker volume rm srcs_wp_data
	docker volume rm srcs_db_data

net:
	docker network ls

vol:
	docker volume ls

.PHONY:	all up down net vol
