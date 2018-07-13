#!/bin/bash -xu

# 1. Import signing keys
sudo apt-key add <<< "$(curl -fsSL https://get.filebot.net/filebot/KEYS)"

# 2. Add deb repository to sources.list
sudo echo "deb [arch=amd64] https://get.filebot.net/deb/ stable main" > /etc/apt/sources.list.d/filebot.list

# 3. Update package index
sudo apt-get update

# 4. Install FileBot and its dependencies
sudo apt-get install filebot --install-suggests
