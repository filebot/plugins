FROM openjdk:8-jre

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

COPY *.deb .
RUN dpkg -i *.deb && rm *.deb

RUN apt-get update && apt-get install -y mediainfo libchromaprint-tools && apt-get clean

ENV HOME /data
ENV JAVA_OPTS "-DuseGVFS=false -Dapplication.deployment=docker"

WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT ["filebot"]
