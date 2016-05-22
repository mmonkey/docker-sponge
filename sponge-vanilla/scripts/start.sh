#!/bin/bash

if [ ! -f "/vanilla/${EXECUTABLE_JAR}" ]; then
	wget -O /vanilla/${EXECUTABLE_JAR} "${SPONGE_URL}"
fi

if [ -n "${MINECRAFT_EULA}" ]; then
	echo "eula=${MINECRAFT_EULA}" > /vanilla/eula.txt
fi

STARTCOMMAND="java"
if [ -n "${MINECRAFT_MAXHEAP}" ]; then
  STARTCOMMAND="${STARTCOMMAND} -Xmx${MINECRAFT_MAXHEAP}"
fi

STARTCOMMAND="${STARTCOMMAND} -jar ${EXECUTABLE_JAR} nogui"
cd /vanilla && exec ${STARTCOMMAND}