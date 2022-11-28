#!/bin/sh -xu

# 1. Add repository
sudo zypper addrepo --enable --refresh --gpgcheck --check 'https://raw.githubusercontent.com/filebot/plugins/master/yum/main.repo'

# 2. Install dependencies
sudo zypper install zenity mediainfo

# 3. Install FileBot
sudo zypper install filebot

# 4. Test Run
filebot -script fn:sysinfo
