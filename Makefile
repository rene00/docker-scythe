NAME = scythe

GIT_COMMIT = $(shell git rev-parse --short=6 HEAD)
ENVIRONMENT = development
SSH_PUB_KEY = $(shell cat /home/rene/.ssh/gemalto.pub)

default: build

build:
	docker build -t $(NAME):$(ENVIRONMENT).$(GIT_COMMIT) \
	    --file=Dockerfile .
run:
	docker run -t --rm --env=SSH_PUB_KEY="$(SSH_PUB_KEY)" \
	    $(NAME):$(ENVIRONMENT).$(GIT_COMMIT)

run_shell:
	docker run -t --rm --env=SSH_PUB_KEY="$(SSH_PUB_KEY)" \
	    -i $(NAME):$(ENVIRONMENT).$(GIT_COMMIT) /bin/sh

all: build run

