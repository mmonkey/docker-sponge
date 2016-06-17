# Docker Sponge

Docker sponge is a Minecraft server environment for [Sponge](https://www.spongepowered.org/) / [Forge](http://files.minecraftforge.net/) servers.

* Supports Sponge Vanilla and Sponge Forge
* Not meant for production environments

## Quick Setup

1. Install [Docker Toolbox](https://www.docker.com/products/docker-toolbox)
2. Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
3. Clone project
    ```bash
    $ git clone git@github.com:mmonkey/docker-sponge.git  
    $ cd docker-sponge/
    ```  
4. Run the setup
    * Create both Sponge Forge and Sponge Vanilla:  
    ```bash
    $ ./setup.sh
    ```
    * Create only Sponge Forge:  
    ```bash
    $ sponge-forge/setup.sh
    ```
    * Create only Sponge Vanilla:  
    ```bash
    $ sponge-vanilla/setup.sh
    ```
5. Browse and update your Mincraft server files in the following locations:
    * `docker-sponge/sponge-forge/data`
    * `docker-sponge/sponge-vanilla/data`
    
### Customizing Quick Setup

1. Edit the `docker-compose.yml` in the root of the project.
    * You can update the following settings:
        * Container Name
        * Port(s)
        * Sponge and Forge Versions
        * Memory
2. You may add additional ports by adding to the `ports:` and `expose:` sections.
3. If you already have a running container you can destroy it:  
    ```bash
    $ docker stop forge  
    $ docker rm forge
    ```  
    and/or  
    ```bash
    $ docker stop vanilla  
    $ docker rm vanilla
    ```
4. Re-build your container:  
    * Both containers (from `docker-sponge/` directory):  
    ```bash
    $ docker-compose up -d
    ```
    * Only Sponge Forge:  
    ```bash
    $ cd docker-forge/  
    $ docker-compose up -d
    ```
    * Only Sponge Vanilla:  
    ```bash
    $ cd docker-vanilla/  
    $ docker-compose up -d
    ```

## Manual Setup

1. Install [Docker Toolbox](https://www.docker.com/products/docker-toolbox)
2. Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
3. Create a docker-machine and setup your environment  
    ```bash
    $ docker-machine create --driver virtualbox sponge  
    $ eval "$(docker-machine env sponge)"
    ```
4. Create container(s):
    
**Sponge Forge**
```bash
$ docker run -itd -p 25566:25566 \
-v /path/on/host:/forge \
-e MINECRAFT_PORT=25566 \
-e MINECRAFT_EULA=true \
-e MINECRAFT_MAXHEAP=1024M \
-e FORGE_VERSION=1.8.9-11.15.1.1890-1.8.9 \
-e SPONGE_VERSION=1.8.9-1890-4.2.0-BETA-1446 \
--name forge mmonkey/sponge-forge
```

**Sponge Vanilla**
```bash
$ docker run -itd -p 25567:25567 \
-v /path/on/host:/vanilla \
-e MINECRAFT_PORT=25567 \
-e MINECRAFT_MAXHEAP=1024M \
-e MINECRAFT_EULA=true \
-e SPONGE_VERSION=1.8.9-4.2.0-BETA-337 \
--name vanilla mmonkey/sponge-vanilla
```

* Minecraft server files will be placed in the path you specified on this line `-v /path/on/host:/forge`
    * On Windows, the host path should start from `/c/Users/<path>`
    * On Mac, the host path should start from `/Users/<path>`
* You may add additional ports by adding `-p XXXX:XXXX --expose XXXX` (change `XXXX` to the desired port number)

## Connecting to the server

**Local Machine**

1. Obtain the server's ip address  
    ```bash
    $ docker-machine ip sponge
    ```
2. Ports (default)
    * Forge: xxx.xxx.xx.xx:**25566**
    * Vanilla: xxx.xxx.xx.xx:**25567**
    
**Network**

1. Open Oracle VM VirtualBox Manager
2. Select the VM used by Docker (sponge)
3. Click Settings -> Network
4. Make sure Adapter 1 is set to "NAT"
5. Click Advanced -> Port Forwarding
6. Add the rules that apply:
    * Name: Forge, Protocol: TCP, Host Port: 25566, Guest Port: 25566 (Leave Host IP and Guest IP empty)
    * Name: Vanilla, Protocol: TCP, Host Port: 25567, Guest Port: 25567 (Leave Host IP and Guest IP empty)
7. Restart docker-machine:  
    ```bash
    $ docker-machine stop sponge  
    $ docker-machine start sponge
    ```

## Attaching to the running containers:

**Windows:**  
```bash
$ winpty docker attach forge  
$ winpty docker attach vanilla
```
**Mac/Linux:**   
```bash
$ docker attach forge  
$ docker attach vanilla
```

## Detaching from the running containers:

Keystroke: `[CTRL]` + `[p]` then `[CTRL]` + `[q]`

**NOTE**: If you `[CTRL]` + `[c]` while attached to the running container, the container will be stopped.

## Starting and stopping the server

```bash
$ docker stop forge  
$ docker start forge
```  
or  
```bash
$ docker stop vanilla  
$ docker start vanilla
```

## Starting, stopping and restarting the virtual machine

* You will need to start the docker machine if the Host computer restarts or powers off
* You may want to stop the docker machine to preserve the Host computers resources

**Starting docker machine**  
```bash
$ docker-machine start sponge
```

**Stopping docker machine**  
```bash
$ docker-machine stop sponge
```

**Restarting docker machine**  
```bash
$ docker-machine restart sponge
```

## Troubleshooting

* When trying to run docker commands in a new bash window: `An error occurred trying to connect:`  
    ```bash
    $ eval "$(docker-machine env sponge)"
    ```