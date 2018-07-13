#!/bin/bash -xu
apt-key add <<< "$(curl -fsSL https://get.filebot.net/filebot/KEYS)"
echo "deb [arch=amd64] https://get.filebot.net/deb/ stable main" > /etc/apt/sources.list.d/filebot.list
apt-get update
apt-get install filebot --install-suggests
