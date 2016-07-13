NAME = scythe

GIT_COMMIT = $(shell git rev-parse --short=6 HEAD)
ENVIRONMENT = development

default: build

build:
	docker build -t $(NAME):$(ENVIRONMENT).$(GIT_COMMIT) \
	    --file=Dockerfile .
run:
	docker run -t --rm $(NAME):$(ENVIRONMENT).$(GIT_COMMIT)

run_shell:
	docker run -t --rm -i $(NAME):$(ENVIRONMENT).$(GIT_COMMIT) /bin/sh

all: build run

