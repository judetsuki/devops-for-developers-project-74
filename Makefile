ci:
	docker compose -f docker-compose.yml run --rm app npm test
