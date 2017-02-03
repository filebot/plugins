#!/bin/sh
docker build --rm -t filebot-node -f Dockerfile.node . && docker run -it -v $PWD:/volume1 -p 5452:5452 filebot-node
