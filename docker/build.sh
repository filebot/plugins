#!/bin/sh
docker build --rm -t filebot -f Dockerfile . && docker run -it -v $PWD:/volume1 -v data:/data filebot -script fn:sysinfo
