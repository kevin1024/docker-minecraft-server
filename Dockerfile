FROM ubuntu
MAINTAINER Kevin McCarthy <me@kevinmccarthy.org>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# begin meat of program

RUN apt-get install -y rubygems openjdk-7-jre-headless openjdk-7-jre-lib

RUN useradd -s /bin/bash -m -c "Minecraft Server" minecraft
USER minecraft

ADD minecraft_server.jar /home/minecraft/minecraft_server.jar

EXPOSE 25565

WORKDIR /home/minecraft

ENTRYPOINT ["/usr/bin/java","-Xmx1024M","-jar","/home/minecraft/minecraft_server.jar"]
