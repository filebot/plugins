#!/bin/sh
docker build --rm -t filebot-watcher -f Dockerfile.watcher . && mkdir -p input output && docker run -it -v $PWD:/volume1 -v data:/data filebot-watcher /volume1/input --output /volume1/output
