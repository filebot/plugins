#!/bin/sh -xu

PACKAGE_VERSION=5.0.2
PACKAGE_SHA256=$(curl -fsSL https://raw.githubusercontent.com/filebot/website/master/get.filebot.net/filebot/FileBot_$PACKAGE_VERSION/FileBot_$PACKAGE_VERSION-portable.tar.xz.sha256)

PACKAGE_FILE=FileBot_$PACKAGE_VERSION-portable.tar.xz
PACKAGE_URL=https://get.filebot.net/filebot/FileBot_$PACKAGE_VERSION/$PACKAGE_FILE


# Download latest portable package
curl -o "$PACKAGE_FILE" -z "$PACKAGE_FILE" "$PACKAGE_URL"

# Check SHA-256 checksum
echo "$PACKAGE_SHA256 *$PACKAGE_FILE" | sha256sum --check || exit 1

# Extract *.tar.xz archive
tar xvf "$PACKAGE_FILE"

# Check if /path/to/filebot.sh works
"$PWD/filebot.sh" -version

# [OPTIONAL] Link `filebot` into the $PATH
sudo ln -sf "$PWD/filebot.sh" /usr/local/bin/filebot

# [OPTIONAL] Check if the `filebot` command works
filebot -script fn:sysinfo
