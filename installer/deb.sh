#!/bin/sh -xu

# print system information
uname -a

# 0. Install pre-requisites
sudo apt-get install --install-recommends dirmngr gnupg-curl apt-transport-https

# 1. Import signing keys
sudo apt-key adv --fetch-keys "https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub"

# 2. Add deb repository to sources.list
echo "deb [arch=all] https://get.filebot.net/deb/ universal main" | sudo tee /etc/apt/sources.list.d/filebot.list

# 3. Update package index
sudo apt-get update

# 4. Install dependencies explicitly (otherwise apt-get autoremove may purge them)
sudo apt-get install --install-recommends default-jre openjfx zenity mediainfo libchromaprint-tools p7zip-full unrar

# 5. Install FileBot
sudo apt-get install --install-recommends filebot

# 6. Test Run
filebot -script fn:sysinfo
