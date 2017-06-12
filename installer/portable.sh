#!/bin/sh -xu

FILEBOT_VERSION=4.7.10
FILEBOT_SHA256=8ade6995e33db309a9aead54bf0f06f70d29d99425278719748dbf62b479cd81

FILEBOT_PACKAGE=FileBot_$FILEBOT_VERSION-portable.tar.xz.gpg
FILEBOT_PACKAGE_URL=https://get.filebot.net/filebot/$FILEBOT_VERSION/$FILEBOT_PACKAGE
FILEBOT_PACKAGE_KEY=4E402EBF7C3C6A71
FILEBOT_PACKAGE_KEY_URL=https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub


# Download latest portable package
curl -o "$FILEBOT_PACKAGE" -z "$FILEBOT_PACKAGE" --retry 5 --location "$FILEBOT_PACKAGE_URL"

# Check SHA-256 checksum
echo "$FILEBOT_SHA256 *$FILEBOT_PACKAGE" | sha256sum --check || exit 1

# initialize GnuPG
curl -fsSL "$FILEBOT_PACKAGE_KEY_URL" | gpg --import

# verify GnuPG signature
gpg --batch --yes --trusted-key "$FILEBOT_PACKAGE_KEY" --output "FileBot.tar.xz" --decrypt "$FILEBOT_PACKAGE" || exit 1

# Extract *.tar.xz archive
tar xvf "FileBot.tar.xz" && rm "FileBot.tar.xz"


# Exit here for fetch only tasks
if [ "$1" = "fetch" ]; then
	echo "Download complete: $FILEBOT_PACKAGE"
	exit 0
fi


# Check if filebot.sh works
"$PWD/filebot.sh" -script fn:sysinfo

# Link into default $PATH
sudo ln -sf "$PWD/filebot.sh" /usr/local/bin/filebot

# Check if the filebot command works
filebot -version