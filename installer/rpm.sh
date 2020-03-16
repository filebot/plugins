#!/bin/sh -xu

# 1. Add repository
sudo dnf config-manager --add-repo https://raw.githubusercontent.com/filebot/plugins/master/yum/universal-jdk8.repo

# 2. Enable repository
sudo dnf config-manager --set-enabled filebot --dump

# 3. Install dependencies
sudo dnf install java-1.8.0-openjdk java-1.8.0-openjdk-openjfx
sudo dnf install jna
sudo dnf install mediainfo p7zip p7zip-plugins

# 4. Install FileBot
sudo dnf install filebot
