#!/bin/sh

# do things that can't possibly not work (unless you don't have /tmp write permission)
date > /tmp/date.txt
whoami > /tmp/whoami.txt
printenv > /tmp/printenv.txt

# try things that might not work
java -version > /tmp/java-version.txt 2>&1
filebot -version > /tmp/filebot-version.txt 2>&1
filebot -script fn:sysinfo > /tmp/filebot-sysinfo.txt 2>&1
filebot -script fn:sysenv > /tmp/filebot-sysenv.txt 2>&1

# TIP: use `tail /tmp/*.txt` to check log files
