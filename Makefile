train:
	docker compose run --rm core-server rasa train --domain domain --config config.yml --fixed-model-name lily --debug

run:
	docker compose up -d

stop:
	docker compose down

core-logs:
	docker compose logs -f core-server

action-logs:
	docker compose logs -f action-server

restart-core:
	docker compose restart core-server

restart-actino:
	docker compose restart action-server

start-action:
	docker compose up action-server -d


redeploy-logs:
	make -f Makefile stop
	make -f Makefile run
	make -f Makefile core-logs

train-redeploy-logs:
	make -f Makefile train
	make -f Makefile redeploy-logs

build:
	docker compose build

ui:
	echo "http://localhost:7999/"
	python -m http.server --directory front_end 7999

visualize:
	rasa visualize --domain domain
