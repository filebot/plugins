FROM rednoah/filebot

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

ENV FILEBOT_NODE_VERSION 0.2.3


WORKDIR /usr/local/filebot-node

RUN FILEBOT_NODE_SHA256=15e8b2d5c5e30c99a2de4715366468721063d8622ffb3882ee168ed0ca8c10ea \
 && FILEBOT_NODE_PACKAGE=filebot-node-${FILEBOT_NODE_VERSION}-generic.tar.bz2 \
 && curl -L -O https://downloads.sourceforge.net/project/filebot/filebot-node/filebot-node-$FILEBOT_NODE_VERSION/$FILEBOT_NODE_PACKAGE \
 && echo "$FILEBOT_NODE_SHA256 *$FILEBOT_NODE_PACKAGE" | sha256sum --check --strict \
 && tar xvf $FILEBOT_NODE_PACKAGE \
 && rm $FILEBOT_NODE_PACKAGE \
 && find . -executable -type f -delete

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash \
 && apt-get install -y nodejs \
 && rm -rf /var/lib/apt/lists/*

COPY filebot-node /usr/bin/filebot-node


ENV FILEBOT_NODE_AUTH NONE

ENV FILEBOT_NODE_HTTP YES
ENV FILEBOT_NODE_HTTP_PORT 5452


EXPOSE $FILEBOT_NODE_HTTP_PORT

ENTRYPOINT ["/usr/bin/filebot-node"]
