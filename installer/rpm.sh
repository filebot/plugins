#!/bin/sh -xu


# Option A: Install FileBot via DNF
if dnf --version 2> /dev/null
then
	# 1. Add repository
	sudo dnf config-manager --add-repo 'https://raw.githubusercontent.com/filebot/plugins/master/yum/main.repo'

	# 2. Enable repository
	sudo dnf config-manager --set-enabled filebot --dump

	# 3. Install dependencies
	sudo dnf install zenity mediainfo

	# 4. Install FileBot
	sudo dnf install filebot
fi


# Option B: Install FileBot via ZYPPER
if zypper --version 2> /dev/null
then
	# 1. Add repository
	sudo zypper addrepo --enable --refresh --gpgcheck --check 'https://raw.githubusercontent.com/filebot/plugins/master/yum/main.repo'

	# 2. Install dependencies
	sudo zypper install zenity mediainfo

	# 3. Install FileBot
	sudo zypper install filebot
fi


# Test Run
filebot -script fn:sysinfo
