FROM openjdk:8-jre

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

RUN	curl -L -o FileBot.deb "https://app.filebot.net/download.php?type=deb&arch=amd64&version=4.7.7" \
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
