.PHONY: build run

.SUFFIXES:

OPEN = $(shell which xdg-open || which open)
HOST ?= 127.0.0.1
PORT ?= 9000

build:
	docker build --rm -t dockerui .

run:
	sudo docker.io run \
		--detach \
		--publish $(HOST):$(PORT):9000 \
		--name=dockerui \
		--volume /var/run/docker.sock:/docker.sock \
		dockerui -e /docker.sock

open:
	$(OPEN) localhost:$(PORT)


