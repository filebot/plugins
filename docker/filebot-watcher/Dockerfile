FROM rednoah/filebot:filebot

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

RUN apt-get update && apt-get install -y \
    inotify-tools \
 && rm -rf /var/lib/apt/lists/*

COPY filebot-watcher /usr/bin/filebot-watcher

VOLUME ["/volume1"]

ENTRYPOINT ["/usr/bin/filebot-watcher"]
