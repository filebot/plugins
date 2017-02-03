FROM openjdk:8-jre

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

ENV FILEBOT_VERSION=4.7.7


RUN curl -sL -O "https://sourceforge.net/projects/filebot/files/filebot/FileBot_${FILEBOT_VERSION}/filebot_${FILEBOT_VERSION}_amd64.deb" \
 && dpkg -i *.deb \
 && rm *.deb

RUN apt-get update && apt-get install -y \
    mediainfo \
    libchromaprint-tools \
    file \
    inotify-tools \
 && rm -rf /var/lib/apt/lists/*


ENV DOCKER_DATA="/data" DOCKER_VOLUME="/volume1"

ENV HOME="$DOCKER_DATA" JAVA_OPTS="-DuseGVFS=false -Dapplication.deployment=docker -Dapplication.dir=$DOCKER_DATA -Djava.util.prefs.userRoot=$DOCKER_DATA/prefs"


WORKDIR $DOCKER_DATA

VOLUME ["$DOCKER_DATA", "$DOCKER_VOLUME"]

ENTRYPOINT ["filebot"]
