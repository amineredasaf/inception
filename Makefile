

ifndef NAME
	NAME=default
endif

build-ng:
	docker build -t $(NAME) ./nginx
run-ng:
	docker run -it -p 8080:8080 $(NAME)

show-im:
	@docker images
show-co:
	@docker ps -a
start:
	./getStarted.sh

clean-img:
	docker image rm $(NAME) # docker images -q

clean-con:
	docker rm $(NAME)
clean:
	rm -f *.info


####################################
# entree on the interactive mode for specific container
# ID=container-id

ifdef ID
bash:
	@docker exec -it $(ID) /bin/bash
else
bash:
	@echo "ERROR: id is not defined\n"
endif