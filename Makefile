
####################################
ifndef NAME
	NG=nginx:testing
	WP=wordpress:testing
	MD=mariadb:testing
	NAME=$(MD)
endif
ifndef PORT
	PORT=443:443
endif
####################################
all: NO_INPUT
####################################
NO_INPUT:
	@echo "NO INPUT WAS GIVEN"
####################################

## Script created to build a .env file for easier environment setup, 
## eliminating the need to manually copy and paste variables every time.
env:
	$(shell  /home/rsaf/Desktop/init.sh)
db:
	$(shell	srcs/requirements/mariadb/tools/db_Init.sh)
build:
	$(shell  /home/rsaf/Desktop/init.sh)
	$(shell	srcs/requirements/mariadb/tools/db_Init.sh)
	sudo rm -rf /home/rsaf/data/*
	sudo mkdir /home/rsaf/data/wp_files /home/rsaf/data/wp_database
	docker-compose --file srcs/docker-compose.yml up --build
wp-build:
	docker build -t $(WP) ./srcs/requirements/wordpress
md-build:
	docker build -t $(MD) ./srcs/requirements/mariadb
ng-build:
	docker build -t $(NG) ./srcs/requirements/nginx
####################################
run:
	docker run -it -p $(PORT) $(NAME)
####################################
img-show:
	@docker images
con-show:
	@docker ps -a
####################################
start:
	./getStarted.sh
clean:
	rm -f *.info IDSFILE
#################################### this function delete all containers [warning : use it carefuly]
all-images-ids:
	@docker image ls -aq > IDSFILE
FILE=IDSFILE
images_IDS = $(shell /usr/bin/cat $(FILE))	
img-clean: all-images-ids
	@docker image rm $(images_IDS)
	@rm -f IDSFILE
#################################### this function delete all containers [warning : use it carefuly]
all-containers-ids:
	@docker container ls -aq > IDSFILE
FILE=IDSFILE
containers_IDS = $(shell /usr/bin/cat $(FILE))
con-clean: all-containers-ids
	@docker rm -f $(containers_IDS)
	@rm -f IDSFILE
##################################### entree on the interactive mode for specific container
# ID=container-id

ifdef ID
bash:
	@docker exec -it $(ID) /bin/bash
else
bash:
	@echo "ERROR: ID is not defined"
endif

prune:
	docker system prune -a
# docker image rm $(docker image ls -aq)
#  docker container rm $(docker container ls -aq)