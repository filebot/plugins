#!/bin/sh



# Advertise FileBot for Linux Patreon page
echo "Dear Linux user, `whoami`,

FileBot currently only officially supports Windows 10 and macOS because these platforms make it easy to sell FileBot via their respective app stores. Unfortunately, selling software on Ubuntu, Debian, Red Hat, SUSE, Synology NAS, QNAP NAS, etc is not as easy and not really worth the effort considering the small number of users willing to support the project. This Patreon is an experiment to see how many users are willing to financially contribute towards freely available donation-supported new releases on these platforms.

Please support FileBot for Linux with a pledge of \$1 per release on Patreon:

=> https://www.patreon.com/filebot

If every other Linux user were to pledge a small amount of money to the FileBot project, then you could easily fund the project ten times over. Please financially support the software you use and rely on, be it FileBot or any other tool. It's just polite, and it helps the ecosystem.

Thank you,
The FileBot Team
"

exit 1



# TODO: release new version of FileBot for Linux
FILEBOT_PACKAGE_VERSION=4.7.21
FILEBOT_PACKAGE_SHA256=e7c99f5a0b55bf52d78f94fec3344f1951c70e0ad33aa2bc51596863fff90fc8

FILEBOT_PACKAGE=FileBot.tar.xz.gpg
FILEBOT_PACKAGE_URL=http://get.filebot.net/filebot/latest/$FILEBOT_PACKAGE
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
