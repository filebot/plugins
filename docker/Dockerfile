FROM ubuntu:rolling

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

RUN apt-get update \
 && apt-get install -y openjdk-11-jre-headless libjna-java libmediainfo0v5 libchromaprint-tools p7zip-full p7zip-rar gnupg curl file inotify-tools \
 && rm -rvf /var/lib/apt/lists/*

RUN apt-key adv --fetch-keys https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub  \
 && echo "deb https://get.filebot.net/deb/ universal main" > /etc/apt/sources.list.d/filebot.list \
 && apt-get update \
 && apt-get install -y filebot \
 && rm -rvf /var/lib/apt/lists/*

VOLUME /data
VOLUME /volume1

ENV HOME /data
ENV LANG C.UTF-8
ENV FILEBOT_OPTS "-Dapplication.deployment=docker -Duser.home=$HOME"

WORKDIR /volume1

ENTRYPOINT ["filebot"]
