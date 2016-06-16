# Docker Sponge

Docker sponge is a Minecraft server environment for [Sponge](https://www.spongepowered.org/) / [Forge](http://files.minecraftforge.net/) servers.

* Supports Sponge Vanilla and Sponge Forge
* Not meant for production environments

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
5. To obtain the ip address:  
    ```
    $ docker-machine ip sponge
    ```

## Connecting to the server

1. Obtain the server's ip address
    ```
    $ docker-machine ip sponge
    ```
2. Ports
    * Forge: xxx.xxx.xx.xx:**25566**
    * Vanilla: xxx.xxx.xx.xx:**25565**

## Attaching to the running containers:

**Windows:**
```
$ winpty docker attach forge
$ winpty docker attach vanilla
```
**Mac/Linux:**
```
$ docker attach forge
$ docker attach vanilla
```

## Detaching from the running containers:

Keystroke: `[CTRL]` + `[p]` then `[CTRL]` + `[q]`

**NOTE**: If you `[CTRL]` + `[c]` while attached to the running container, the container will be stopped.

## Starting and stopping the server

```
$ docker stop forge
$ docker start forge
```
or
```
$ docker stop vanilla
$ docker start vanilla
```

## Troubleshooting

* When trying to run docker commands in a new bash window: `An error occurred trying to connect:`
    ```
    $ eval "$(docker-machine env sponge)"
    ```