# Project: collectd
# Author: AooJ <aooj@n13.cz>
# Date: 2014
# usage:
#	make build	- build new image from Dockerfile
#	make debug	- debug run already created image and attach to it
#	make try	- build and run in debug mode
#	make remove	- discarding current running production container

NAME=aooj/collectd
ID=collectd-host
VERSION=1.0


build:
	docker build -t $(NAME):$(VERSION) .


debug:
	docker run  --entrypoint="/bin/bash" --rm -p 4567 -ti --link kickass_einstein:etcd $(NAME):$(VERSION) -c /bin/bash

remove:
	docker kill $(ID) > /dev/null 2>&1
	docker rm $(ID) > /dev/null 2>&1

run:
	docker run -d --name $(ID) $(NAME):$(VERSION)


try: build debug


.PHONY: build debug try run remove logs deploy

