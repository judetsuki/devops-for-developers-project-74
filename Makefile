# Подготовка проекта (CI вызывает это первым)
setup:
	make -C app setup
	docker compose build

# Линтинг (здесь была ошибка в путях)
lint:
	make -C app lint
	# Используем "-", чтобы make не падал у вас локально, если hadolint не установлен
	-hadolint Dockerfile
	-hadolint Dockerfile.production

# Запуск тестов (ваша рабочая команда с пробросом окружения)
test:
	docker compose -f docker-compose.yml run --rm -e NODE_ENV=test app npm test

# Команда для CI (как того требует Hexlet)
ci:
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app
