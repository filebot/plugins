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
ENV FILEBOT_OPTS "-Dapplication.dir=$DOCKER_DATA -Dapplication.cache=$DOCKER_DATA/cache -Djava.io.tmpdir=$DOCKER_DATA/tmp -DuseGVFS=false -Djava.net.useSystemProxies=false -Dapplication.deployment=docker -Duser.home=$DOCKER_DATA -Djava.util.prefs.PreferencesFactory=net.filebot.util.prefs.FilePreferencesFactory -Dnet.filebot.util.prefs.file=$DOCKER_DATA/prefs.properties"


WORKDIR $DOCKER_DATA

VOLUME ["$DOCKER_DATA", "$DOCKER_VOLUME"]

ENTRYPOINT ["filebot"]
