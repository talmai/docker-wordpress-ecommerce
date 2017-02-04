DOCKER_IMAGE_VERSION=1.0
DOCKER_IMAGE_NAME=talmai/wordpress-ecommerce
DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

default: build

build:
	docker build -t $(DOCKER_IMAGE_TAGNAME) .
	docker tag $(DOCKER_IMAGE_TAGNAME) $(DOCKER_IMAGE_NAME):latest

push: build
	docker push $(DOCKER_IMAGE_TAGNAME)
	docker push $(DOCKER_IMAGE_NAME):latest
	
cleanup:
	docker ps -a | grep Exited | cut -d ' ' -f 1 | xargs docker rm
	docker rmi $(docker images --quiet --filter "dangling=true")

rmi:
	docker rmi -f $(DOCKER_IMAGE_TAGNAME)

rebuild: clean rmi build