#!/bin/sh -xu

# Download latest portable package
curl -v -L -o "FileBot-portable.tar.xz" "https://sourceforge.net/projects/filebot/files/filebot/HEAD/FileBot_4.7.8_B2/FileBot_4.7.8-portable.tar.xz"

# Extract *.tar.xz archive
tar xvf "FileBot-portable.tar.xz"

# Check if filebot.sh works
"$PWD/filebot.sh" -script fn:sysinfo

# Link into default $PATH
sudo ln -sf "$PWD/filebot.sh" /usr/local/bin/filebot

# Check if the filebot command works
filebot -version
