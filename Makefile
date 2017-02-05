#ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

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
	
rmi:
	docker rmi -f $(DOCKER_IMAGE_TAGNAME)
	#docker ps -a | grep Exited | cut -d ' ' -f 1 | xargs docker rm
	#docker rmi $(docker images --quiet --filter "dangling=true")

#test: build
	#docker run --name wordpressdb -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wordpress -d mariadb
	## docker run --name wordpress-ecommerce --link wordpressdb:mysql -d -v $(PWD)/wp_folder:/var/www/html -p 8080:80 talmai/wordpress-ecommerce
	#docker run --name wordpress-ecommerce --link wordpressdb:mysql -d -v $(ROOT_DIR)/wp_folder:/var/www/html -p 8080:80 talmai/wordpress-ecommerce
	# 	docker exec wordpress-ecommerce wp-themese-setup \
	-e MONEI_TEST_CHANNEL_ID=XXX \
	-e MONEI_TEST_USER_ID=XXX \
	-e MONEI_TEST_PASSWORD=XXX 
	