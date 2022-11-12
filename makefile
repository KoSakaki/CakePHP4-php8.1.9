up:
	docker-compose up -d
start:
	docker-compose start
stop:
	docker-compose stop
down:
	docker-compose down

build:
	docker-compose up -d --build
	docker-compose exec php-apache2 composer update

inspect:
	docker ps

DBexec:
	docker-compose exec mysql /bin/bash
# username: root
# password: root

phpmyadmin:
	open http://0.0.0.0:8081
