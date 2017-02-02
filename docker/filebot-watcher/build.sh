#!/bin/sh
docker build --rm -t filebot-watcher . && docker run -it -v $PWD:/volume1 -v data:/data filebot-watcher /volume1/input --output /volume1/output
