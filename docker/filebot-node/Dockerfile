FROM rednoah/filebot:filebot

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

WORKDIR /usr/local/filebot-node

RUN curl -sL -O "https://sourceforge.net/projects/filebot/files/filebot-node/filebot-node-0.2.3/filebot-node-0.2.3-generic.tar.bz2" \
 && tar xvf *.tar.* \
 && rm *.tar.*

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash \
 && apt-get install -y nodejs \
 && rm -rf /var/lib/apt/lists/*

COPY start .

ENV FILEBOT_NODE_AUTH NONE

EXPOSE 5452

WORKDIR /volume1

VOLUME ["/volume1"]

ENTRYPOINT ["/usr/local/filebot-node/start"]
