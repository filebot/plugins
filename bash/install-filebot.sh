#!/bin/sh -xu

FILEBOT_VERSION=4.7.5
FILEBOT_SHA256=bb305d11922dbac3d7551177a45cab9e24c043a1993f5a8b160c887f317d0429

FILEBOT_PACKAGE=FileBot_$FILEBOT_VERSION-portable.tar.xz
FILEBOT_PACKAGE_URL=https://sourceforge.net/projects/filebot/files/filebot/FileBot_$FILEBOT_VERSION/$FILEBOT_PACKAGE


# Download latest portable package
curl -sL -O "$FILEBOT_PACKAGE_URL"

# Check SHA-256 checksum
echo "$FILEBOT_SHA256 *$FILEBOT_PACKAGE" | sha256sum --check --strict || exit 1

# Extract *.tar.xz archive
tar xvf "$FILEBOT_PACKAGE"

# Check if filebot.sh works
"$PWD/filebot.sh" -script fn:sysinfo

# Link into default $PATH
sudo ln -sf "$PWD/filebot.sh" /usr/local/bin/filebot

# Check if the filebot command works
filebot -version
