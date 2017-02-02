FROM openjdk:8-jre

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

RUN curl -sL -O "https://sourceforge.net/projects/filebot/files/filebot/FileBot_4.7.7/filebot_4.7.7_amd64.deb" \
 && dpkg -i *.deb \
 && rm *.deb

RUN apt-get update && apt-get install -y \
    mediainfo \
    libchromaprint-tools \
 && rm -rf /var/lib/apt/lists/*

ENV HOME /data
ENV JAVA_OPTS "-DuseGVFS=false -Dapplication.deployment=docker -Dapplication.dir=/data -Djava.util.prefs.userRoot=/data/prefs"

WORKDIR /data

VOLUME ["/data"]

ENTRYPOINT ["filebot"]
