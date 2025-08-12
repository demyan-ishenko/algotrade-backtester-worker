.PHONY: start stop

# D: 1/yes/true/on => detached (-d); anything else => attached
D ?= 1
DETACH_FLAG := $(if $(filter $(D),1 yes true on),-d,)

# можно переопределить: make COMPOSE="docker compose -f docker-compose.yml -f docker-compose.prod.yml" start
COMPOSE ?= docker compose

start:
	$(COMPOSE) up -d watchtower
	$(COMPOSE) up $(DETACH_FLAG) --force-recreate --no-deps strategies-go backtester-worker

stop:
	$(COMPOSE) stop