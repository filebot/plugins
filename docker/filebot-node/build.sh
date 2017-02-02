#!/bin/sh
docker build --rm -t filebot-node . && docker run -it -p 5452:5452 filebot-node
