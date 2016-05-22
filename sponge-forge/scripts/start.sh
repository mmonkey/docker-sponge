#!/bin/bash

if [ ! -f "/forge/${EXECUTABLE_JAR}" ]; then
	cd /forge
	wget -O /forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar "${FORGE_URL}"
	java -jar /forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar --installServer
	rm -f /forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar
fi

if [ ! -f "/forge/server.properties" ]; then
	echo "server-port=${PORT}" > /forge/server.properties
fi

if [ -n "${MINECRAFT_EULA}" ]; then
	echo "eula=${MINECRAFT_EULA}" > /forge/eula.txt
fi

if [ ! -d "/forge/mods/" ]; then
	mkdir -p /forge/mods
fi

if [ ! -f "/forge/mods/spongeforge-${SPONGE_VERSION}.jar" ]; then
	wget -O /forge/mods/spongeforge-${SPONGE_VERSION}.jar "${SPONGE_URL}"
fi

STARTCOMMAND="java"
if [ -n "${MINECRAFT_MAXHEAP}" ]; then
  STARTCOMMAND="${STARTCOMMAND} -Xmx${MINECRAFT_MAXHEAP}"
fi

STARTCOMMAND="${STARTCOMMAND} -jar ${EXECUTABLE_JAR} nogui"
cd /forge && exec ${STARTCOMMAND}