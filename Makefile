setup:
	docker compose run --rm app make setup

up-exist:
	docker compose up --abort-on-container-exist

start:
	docker compose up

down:
	docker compose down

ci:
	docker compose -f docker-compose.yml up --abort-on-container-exit

test:
	docker compose -f docker-compose.yml up --abort-on-container-exit


ci-build:
	docker compose -f docker-compose.yml build app

push:
	docker compose -f docker-compose.yml push app

up-development:
	docker run -p 8080:8080 -e NODE_ENV=development mtfoxtrot/devops-for-developers-project-74/latest make dev