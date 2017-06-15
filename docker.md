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

 $ sudo docker run -d --name NAME_OF_MY_CONTAINER -p HOST_MACHINE_PORT:MY_CONTAINER_PORT IMAGE
 ```
 * [docker restart](https://docs.docker.com/engine/reference/commandline/restart/)
 ```bash

 $ sudo docker restart MY_CONTAINER
 ```
 * [docker exec](https://docs.docker.com/engine/reference/commandline/exec/)
 ```bash
 $ sudo docker exec -it NAME_OF_MY_CONTAINER bash
 ```
