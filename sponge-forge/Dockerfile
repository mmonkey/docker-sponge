FROM java:8

MAINTAINER CJ O'Hara (mmonkey)

ENV PORT 25566
ENV MINECRAFT_VERSION 1.8.9
ENV MINECRAFT_EULA true
ENV MINECRAFT_MAXHEAP 1024M

ENV FORGE_VERSION 11.15.1.1890-1.8.9
ENV FORGE_URL http://files.minecraftforge.net/maven/net/minecraftforge/forge/${MINECRAFT_VERSION}-${FORGE_VERSION}/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar

ENV SPONGE_VERSION 1.8.9-1890-4.1.0-BETA-1320
ENV SPONGE_URL http://files.minecraftforge.net/maven/org/spongepowered/spongeforge/${SPONGE_VERSION}/spongeforge-${SPONGE_VERSION}.jar

ENV EXECUTABLE_JAR forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-universal.jar

RUN DEBIAN_FRONTEND=noninteractive
VOLUME ["/forge"]

ADD ./scripts/start.sh /start_forge
RUN chmod +x /start_forge

EXPOSE ${PORT}
CMD ["/start_forge"]