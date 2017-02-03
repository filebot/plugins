FROM openjdk:8-jre

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

ENV FILEBOT_VERSION=4.7.7

RUN curl -sL -O "https://sourceforge.net/projects/filebot/files/filebot/FileBot_${FILEBOT_VERSION}/filebot_${FILEBOT_VERSION}_amd64.deb" \
 && dpkg -i *.deb \
 && rm *.deb

RUN apt-get update && apt-get install -y \
    mediainfo \
    libchromaprint-tools \
    inotify-tools \
 && rm -rf /var/lib/apt/lists/*

ENV HOME /data
ENV JAVA_OPTS "-DuseGVFS=false -Dapplication.deployment=docker -Dapplication.dir=/data -Djava.util.prefs.userRoot=/data/prefs"

WORKDIR /data

VOLUME ["/data", "/volume1"]

ENTRYPOINT ["filebot"]
