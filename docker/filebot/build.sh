#!/bin/sh
docker build --rm -t filebot . && docker run -it -v data:/data filebot -script fn:sysinfo
