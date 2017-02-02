FROM openjdk:8-jre

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

WORKDIR /files

COPY *.deb .
RUN dpkg -i *.deb

RUN apt-get update
RUN apt-get install -y mediainfo libchromaprint-tools
RUN apt-get clean

CMD ["filebot", "-script", "fn:sysinfo"]
