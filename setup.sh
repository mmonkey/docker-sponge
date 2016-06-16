#!/bin/bash

# create docker-machine
docker-machine create --driver virtualbox sponge
eval "$(docker-machine env sponge)"

# build containers
docker-compose up -d