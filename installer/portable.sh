#!/bin/sh

PACKAGE_VERSION=4.8.2
PACKAGE_SHA256=053da832ab79726e3abd53cb692e6c484d0659eb174c4248ef4e054a01b3956e

PACKAGE_FILE=FileBot_$PACKAGE_VERSION-portable.tar.xz
PACKAGE_URL=https://get.filebot.net/filebot/FileBot_$PACKAGE_VERSION/$PACKAGE_FILE


# Download latest portable package
curl -o "$PACKAGE_FILE" -z "$PACKAGE_FILE" --location "$PACKAGE_URL"

# Check SHA-256 checksum
echo "$PACKAGE_SHA256 *$PACKAGE_FILE" | sha256sum --check || exit 1

# Extract *.tar.xz archive
tar xvf "$PACKAGE_FILE"

# Check if filebot.sh works
"$PWD/filebot.sh" -script fn:sysinfo

# Link into default $PATH
sudo ln -sf "$PWD/filebot.sh" /usr/local/bin/filebot

# Check if the filebot command works
filebot -version
