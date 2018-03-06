# MySQL Container

**To adapt the configuration**

```bash
sudo mkdir -p /docker/volumes/mysql/{conf,data}
sudo docker run --name tmp-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=rootpass -d mysql:latest
sudo docker cp tmp-mysql:/etc/mysql/conf.d/docker.cnf /docker/volumes/mysql/conf/docker.cnf
sudo docker stop tmp-mysql
sudo docker rm -f tmp-mysql
```

**docker-compose.yml**

```bash
version: "3"

services:
  mysql:
    image: mysql:latest
    ports:
      - "3306:3306"
    volumes:
      - /docker/volumes/mysql/data:/var/lib/mysql
      - /docker/volumes/mysql/conf/docker.cnf:/etc/mysql/conf.d/docker.cnf
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
    container_name: mysql
```


## Forcing InnoDB Recovery

```
[mysqld]

innodb_force_recovery = 1
```
