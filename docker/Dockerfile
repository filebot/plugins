FROM openjdk:8-jre

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

ENV FILEBOT_VERSION 4.7.7


WORKDIR /usr/share/filebot

RUN FILEBOT_SHA256=65a61c6f21071084576ac70cb2302a2771419c36d1fd6423f10c7677055da05f \
 && FILEBOT_PACKAGE=filebot_${FILEBOT_VERSION}_amd64.deb \
 && curl -L -O https://downloads.sourceforge.net/project/filebot/filebot/FileBot_$FILEBOT_VERSION/$FILEBOT_PACKAGE \
 && echo "$FILEBOT_SHA256 *$FILEBOT_PACKAGE" | sha256sum --check --strict \
 && dpkg -i $FILEBOT_PACKAGE \
 && rm $FILEBOT_PACKAGE

RUN apt-get update && apt-get install -y \
    mediainfo \
    libchromaprint-tools \
    file \
    inotify-tools \
 && rm -rf /var/lib/apt/lists/*


ENV DOCKER_DATA /data
ENV DOCKER_VOLUME /volume1

ENV HOME $DOCKER_DATA
ENV JAVA_OPTS "-DuseGVFS=false -Dapplication.deployment=docker -Dapplication.dir=$DOCKER_DATA -Djava.util.prefs.userRoot=$DOCKER_DATA/prefs"


WORKDIR $DOCKER_DATA

VOLUME ["$DOCKER_DATA", "$DOCKER_VOLUME"]

ENTRYPOINT ["filebot"]
