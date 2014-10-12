# Project: collectd
# Author: AooJ <aooj@n13.cz>
# Date: 2014
# usage:
#	make build	- build new image from Dockerfile
#	make debug	- debug run already created image and attach to it
#	make try	- build and run in debug mode
#	make remove	- discarding current running production container

NAME=aooj/collectd
ID=collectd-sandbox
VERSION=1.1


build:
	docker build -t $(NAME):$(VERSION) .


debug:
	docker run --entrypoint="/bin/bash" --rm -p 4567 -ti $(NAME):$(VERSION) -c /bin/bash

remove:
	docker kill $(ID) > /dev/null 2>&1
	docker rm $(ID) > /dev/null 2>&1

run:
	docker run -d -h $(ID]--name $(ID) -p 4567:4567 $(NAME):$(VERSION)


try: build debug


.PHONY: build debug run remove try

