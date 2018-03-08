#!/bin/sh -xu

FILEBOT_PACKAGE=FileBot.tar.xz.gpg
FILEBOT_PACKAGE_URL=http://get.filebot.net/filebot/latest/$FILEBOT_PACKAGE
FILEBOT_PACKAGE_SHA256=6c68e09a60f4f9aaff6e5ebd93e7f284bb2204ab0314f0635a355494916c7935
FILEBOT_PACKAGE_KEY=4E402EBF7C3C6A71
FILEBOT_PACKAGE_KEY_URL=https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub


# Download latest portable package
curl -o "$FILEBOT_PACKAGE" -z "$FILEBOT_PACKAGE" --retry 5 --location "$FILEBOT_PACKAGE_URL"

# Check SHA-256 checksum
echo "$FILEBOT_PACKAGE_SHA256 *$FILEBOT_PACKAGE" | sha256sum --check || exit 1

# initialize GnuPG
curl -fsSL "$FILEBOT_PACKAGE_KEY_URL" | gpg --import

# verify GnuPG signature
gpg --batch --yes --trusted-key "$FILEBOT_PACKAGE_KEY" --output "FileBot.tar.xz" --decrypt "$FILEBOT_PACKAGE" || exit 1

# Extract *.tar.xz archive
tar xvf "FileBot.tar.xz" && rm "FileBot.tar.xz"


# Check if filebot.sh works
"$PWD/filebot.sh" -script fn:sysinfo

# Link into default $PATH
sudo ln -sf "$PWD/filebot.sh" /usr/local/bin/filebot

# Check if the filebot command works
filebot -version
