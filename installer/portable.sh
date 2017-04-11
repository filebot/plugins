#!/bin/sh -xu

FILEBOT_VERSION=4.7.9
FILEBOT_SHA256=2531bc67d3522b1db05870da2b72fff580ebfa5969655e75382ffe2c8dec6867

FILEBOT_PACKAGE=FileBot_$FILEBOT_VERSION-portable.tar.xz
FILEBOT_PACKAGE_URL=https://downloads.sourceforge.net/project/filebot/filebot/FileBot_$FILEBOT_VERSION/$FILEBOT_PACKAGE


# Download latest portable package
curl -L -O "$FILEBOT_PACKAGE_URL"

# Check SHA-256 checksum
echo "$FILEBOT_SHA256 *$FILEBOT_PACKAGE" | sha256sum --check || exit 1

# Extract *.tar.xz archive
tar xvf "$FILEBOT_PACKAGE"

# Check if filebot.sh works
"$PWD/filebot.sh" -script fn:sysinfo

# Link into default $PATH
sudo ln -sf "$PWD/filebot.sh" /usr/local/bin/filebot

# Check if the filebot command works
filebot -version
