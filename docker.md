## Docker documentation
[https://docs.docker.com/](https://docs.docker.com/)

## Installation
[https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)

## Docker YouTube channel
[https://www.youtube.com/user/dockerrun](https://www.youtube.com/user/dockerrun)

## Bind container ports to the host
[https://docs.docker.com/engine/userguide/networking/default_network/binding/](https://docs.docker.com/engine/userguide/networking/default_network/binding/)

```bash
$ sudo iptables -t nat -L -n
```

## Docker commands
[https://docs.docker.com/edge/engine/reference/commandline/docker/](https://docs.docker.com/edge/engine/reference/commandline/docker/
  )

 * [docker images](https://docs.docker.com/edge/engine/reference/commandline/images/)
 ```bash
  $ sudo docker images
 ```

 * [docker ps](https://docs.docker.com/edge/engine/reference/commandline/ps/)
 ```bash
 $ sudo docker ps
 ```

 * [docker run](https://docs.docker.com/engine/reference/commandline/run/)
 ```bash
 # Run container in background.

 $ sudo docker run -d --name {NAME_OF_MY_CONTAINER} -p {HOST_MACHINE_PORT}:{MY_CONTAINER_PORT} {IMAGE}

 # For example (bind all)
 $ sudo docker run --name mysql -p 3306:3306 -d mysql:latest

 # For example (bind IP 192.168.0.1)
 $ sudo docker run -d --name mysql -p 192.168.0.1:3306:3306 mysql:latest
 ```

 * [docker start](https://docs.docker.com/engine/reference/commandline/start/)
 ```bash

 $ sudo docker start {MY_CONTAINER}
 ```

 * [docker stop](https://docs.docker.com/engine/reference/commandline/stop/)
 ```bash

 $ sudo docker stop {MY_CONTAINER}
 ```

 * [docker restart](https://docs.docker.com/engine/reference/commandline/restart/)
 ```bash

 $ sudo docker restart {MY_CONTAINER}
 ```

 * [docker exec](https://docs.docker.com/engine/reference/commandline/exec/)
 ```bash
 $ sudo docker exec -it {NAME_OF_MY_CONTAINER} bash
 ```

 * [docker save](https://docs.docker.com/engine/reference/commandline/save/)
 ```bash
 # Save one or more images to a tar archive.

 $ sudo docker save {DOCKER_IMAGES} > {IMAGE_FILE_NAME}.tar
 ```

 * [docker load](https://docs.docker.com/engine/reference/commandline/load/)
 ```bash
 # Load an image from a tar archive.

 $ sudo docker load < {IMAGE_FILE_NAME}.tar
 ```

 * [docker build](https://docs.docker.com/engine/reference/commandline/build/)
 ```bash
 # Build with PATH and tag. [name:tag]

 # Create a Dockerfile.
 $ sudo touch Dockerfile

 # For example:
 $ sudo docker build -t="project/api:1.0.0" .
 ```

## Dockerfile
For example: Spring Boot with Docker and setting timezone

```
FROM openjdk:8-jdk-alpine

MAINTAINER James Ho <jamesho.tw@gmail.com>

RUN apk add -U tzdata
RUN cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime
RUN echo "Asia/Taipei" > /etc/timezone
RUN apk del tzdata

VOLUME /tmp
ADD target/app-1.0.0-RELEASE.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
```
