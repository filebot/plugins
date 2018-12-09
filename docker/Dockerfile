FROM openjdk:11-jre

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

ENV FILEBOT_VERSION 4.8.5


WORKDIR /usr/share/filebot


RUN curl -fsSL https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub | apt-key add \
 && echo "deb https://get.filebot.net/deb/ stable universal" > /etc/apt/sources.list.d/filebot.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends filebot libjna-jni libmediainfo0v5 libchromaprint-tools p7zip-full p7zip-rar curl file inotify-tools \
 && rm -rvf /var/lib/apt/lists/*


ENV DOCKER_DATA /data
ENV DOCKER_VOLUME /volume1


ENV HOME $DOCKER_DATA
ENV FILEBOT_OPTS "-Dapplication.deployment=docker -Duser.home=$HOME"


WORKDIR $DOCKER_DATA

VOLUME ["$DOCKER_DATA", "$DOCKER_VOLUME"]

ENTRYPOINT ["filebot"]
