#!/bin/sh -xu

# 1. Import signing keys
sudo apt-key adv --fetch-keys "https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub"

# 2. Add deb repository to sources.list
echo "deb https://get.filebot.net/deb/ universal main" | sudo tee /etc/apt/sources.list.d/filebot.list

# 3. Update package index
sudo apt-get update

# 4. Install FileBot and its dependencies
sudo apt-get install filebot
