FROM openjdk:10-jre

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

ENV FILEBOT_VERSION 4.8.2


WORKDIR /usr/share/filebot


RUN curl -fsSL https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub | apt-key add \
 && echo "deb [arch=amd64] https://get.filebot.net/deb/ stable main" > /etc/apt/sources.list.d/filebot.list \
 && apt-get update \
 && apt-get install -y filebot mediainfo libchromaprint-tools curl file inotify-tools \
 && rm -rvf /var/lib/apt/lists/*


ENV DOCKER_DATA /data
ENV DOCKER_VOLUME /volume1


ENV HOME $DOCKER_DATA
ENV FILEBOT_OPTS "-Dapplication.deployment=docker -Duser.home=$HOME"


WORKDIR $DOCKER_DATA

VOLUME ["$DOCKER_DATA", "$DOCKER_VOLUME"]

ENTRYPOINT ["filebot"]
