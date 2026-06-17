VOLUMES_PATH = /home/${USER}/data

DB_PATH = ${VOLUMES_PATH}/mariadb
WP_PATH = ${VOLUMES_PATH}/wordpress

all:
	mkdir -p ${DB_PATH} ${WP_PATH}
	docker compose -f srcs/docker-compose.yml up --build -d

restart:
	docker compose -f srcs/docker-compose.yml restart

status:
	docker compose -f srcs/docker-compose.yml ps

logs:
	docker compose -f srcs/docker-compose.yml logs -f

dbshell:
	docker exec -it mariadb mysql -u root -p

wpshell:
	docker exec -it wp-php sh

nginxshell:
	docker exec -it nginx sh

rebuild-db:
	docker compose -f srcs/docker-compose.yml build database

rebuild-wp:
	docker compose -f srcs/docker-compose.yml build wordpress

rebuild-nginx:
	docker compose -f srcs/docker-compose.yml build nginx

clean: stop
	docker system prune -a --force

fclean: clean
	sudo rm -rf /home/${USER}/data

re: fclean all

buildmariadb:
	docker build srcs/requirements/mariadb -t mariadb

runmariadb: buildmariadb
	mkdir -p ${DB_PATH} ${WP_PATH}
	docker run mariadb

stop:
	docker compose -f srcs/docker-compose.yml down

help:
	@echo "Available targets:"
	@echo "  make            Build and start the stack"
	@echo "  make restart    Restart the containers"
	@echo "  make stop       Stop the stack"
	@echo "  make clean      Stop the stack and prune Docker data"
	@echo "  make fclean     Remove persistent data under /home/$$USER/data"
	@echo "  make re         Full reset and relaunch"
	@echo "  make status     Show container status"
	@echo "  make logs       Show and follow logs for all services"
	@echo "  make dbshell    Open a MariaDB shell in the database container"
	@echo "  make wpshell    Open a shell in the Wordpress container"
	@echo "  make nginxshell Open a shell in the Nginx container"
	@echo "  make rebuild-db Rebuild the database service"
	@echo "  make rebuild-wp Rebuild the Wordpress service"
	@echo "  make rebuild-nginx Rebuild the Nginx service"



.PHONY: all clean fclean stop testdb re buildmariadb runmariadb help restart status logs dbshell wpshell nginxshell rebuild-db rebuild-wp rebuild-nginx
