#!/bin/sh -xu

# Download latest portable package
wget "https://sourceforge.net/projects/filebot/files/filebot/HEAD/FileBot_4.7.8_B1/FileBot_4.7.8-portable.tar.xz"

# Extract *.tar.xz archive
tar xvf *.tar.xz

# Download native libraries
wget "https://github.com/filebot/filebot/raw/master/lib/native/linux-amd64/fpcalc"
wget "https://github.com/filebot/filebot/raw/master/lib/native/linux-amd64/lib7-Zip-JBinding.so"
wget "https://github.com/filebot/filebot/raw/master/lib/native/linux-amd64/libjnidispatch.so"
wget "https://github.com/filebot/filebot/raw/master/lib/native/linux-amd64/libmediainfo.so"
wget "https://github.com/filebot/filebot/raw/master/lib/native/linux-amd64/libzen.so"

# Verify filebot.sh works
$PWD/filebot.sh -script fn:sysinfo

# Link into default $PATH
sudo ln -sf $PWD/filebot.sh /usr/local/bin/filebot

# Verify filebot command works
filebot -version && echo "DONE"
