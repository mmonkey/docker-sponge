# Docker Sponge

## Setup

1. Install [Docker Toolbox](https://www.docker.com/products/docker-toolbox)
2. Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
3. Clone project  
    ```
    $ git clone git@github.com:mmonkey/docker-sponge.git
    $ cd docker-sponge/
    ```
4. Run the setup  
    ```
    $ ./setup.sh
    ```
5. Note the machine's ip address  
    ```
    $ docker-machine ip sponge
    ```
6. Connect to the Docker daemon  
    ```
    eval "$(docker-machine env sponge)"
    ```
8. Run docker-compose  
    ```
    docker-compose up -d
    ```
    
## Attaching to the running containers:

**Windows:**
```
$ winpty docker attach forge
```
or
```
$ winpty docker attach vanilla
```
**Mac/Linux:**
```
$ docker attach forge
```
or
```
$ docker attach vanilla
```

## Detaching from the running containers:

Keystroke: `[CTRL]` + `[p]` then `[CTRL]` + `[q]`
**NOTE**: If you `[CTRL]` + `[c]` while attached to the running container, the container will be stopped.