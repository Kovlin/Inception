all :
	docker-compose -f ./srcs/docker-compose.yml up --build -d

stop :
	docker-compose -f ./srcs/docker-compose.yml stop

clean:
	docker-compose -f ./srcs/docker-compose.yml rm

down :
	docker-compose -f ./srcs/docker-compose.yml down --volumes