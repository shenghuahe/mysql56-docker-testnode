run:
	docker run --name mysql56 -e MYSQL_ROOT_PASSWORD=12345 -p 13306:3306 -d mysql/mysql-server:5.6
add-user:
	docker cp server_ready.sh mysql56:/tmp/server_ready.sh
	docker cp create_user.sql mysql56:/tmp/create_user.sql
	docker exec mysql56 /bin/bash /tmp/server_ready.sh
	docker exec mysql56 /bin/bash -c 'mysql -u root -p12345 < /tmp/create_user.sql'
stop:
	docker stop mysql56
exec:
	docker exec -it mysql56 /bin/bash
clean:
	docker rm $$(docker ps -f name=mysql56 -aq)
start:
	docker start $$(docker ps -l | grep mysql56 | awk '{print $$1}')

build: start add-user
destroy:stop clean


.PHONY: start add-user stop exec clean run
