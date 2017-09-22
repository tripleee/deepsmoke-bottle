DOCKER_VERSION := $(shell git describe --always)

.PHONY: docker
docker: docker-build.log
	tag=$$(awk 'END { print $$NF }' $<) \
	&& docker tag $$tag tripleee/deepsmoke-bottle:$$tag\
	&& docker tag $$tag tripleee/deepsmoke-bottle:latest\
	&& docker push tripleee/deepsmoke-bottle:$$tag

docker-build.log: Dockerfile
	docker build . | tee $@
