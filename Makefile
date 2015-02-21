.PHONY: build run

.SUFFIXES:

OPEN = $(shell which xdg-open || which open)
HOST ?= 127.0.0.1
PORT ?= 9000

build:
	docker build --rm -t dockerui.i386 .

run:
	sudo docker.io run \
		--detach \
		--publish $(HOST):$(PORT):9000 \
		--name=dockerui.i386 \
		--volume /var/run/docker.sock:/docker.sock \
		rremizov/dockerui.i386 -e /docker.sock

open:
	$(OPEN) localhost:$(PORT)


