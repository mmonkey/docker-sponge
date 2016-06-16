# Docker Sponge

## Setup

1. Install [Docker Toolbox](https://www.docker.com/products/docker-toolbox)
2. Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
3. Clone project
    ```
    git clone git@github.com:mmonkey/docker-sponge.git
    cd docker-sponge/
    ```
4. Create the docker machine
    ```
    docker-machine create --driver virtualbox sponge
    ```
5. Note the machine's ip address
    ```
    docker-machine ip sponge
    ```
6. Connect to the Docker daemon
    ```
    eval "$(docker-machine env sponge)"
    ```
8. Run docker-compose
    ```
    docker-compose up -d
    ```
    
## Connecting to the running containers

To connect forge do the following:

**Windows:**
```
winpty docker exec -it forge bash
```
**Mac/Linux:**
```
docker exec -it forge bash
```