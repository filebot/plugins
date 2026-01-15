#!/bin/sh -xu

# print system information
uname -a

# 0. Install pre-requisites
sudo apt-get install -y --install-recommends dirmngr gnupg-curl apt-transport-https

# 1. Import signing keys
curl -o "/etc/apt/sources.list.d/filebot.sources" "https://raw.githubusercontent.com/filebot/plugins/master/apt/filebot.sources"

# 2. Update package index
sudo apt-get update

# 3. Install dependencies explicitly (otherwise apt-get autoremove may purge them)
sudo apt-get install -y --install-recommends default-jre openjfx zenity mediainfo libchromaprint-tools p7zip-full unrar

# 4. Install FileBot
sudo apt-get install -y --install-recommends filebot

# 5. Test Run
filebot -script fn:sysinfo
