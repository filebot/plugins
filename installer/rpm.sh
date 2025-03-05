#!/bin/sh -xu


# Option A: Install FileBot via DNF5
if dnf5 --version 2> /dev/null
then
	# 0. Install dnf config-manager
	sudo dnf5 -y install 'dnf-command(config-manager)'

	# 1. Add repository
	sudo dnf5 -y config-manager addrepo --from-repofile='https://raw.githubusercontent.com/filebot/plugins/master/yum/main.repo'

	# 2. Enable repository
	sudo dnf5 -y config-manager setopt filebot.enabled=1

	# 3. Install dependencies
	sudo dnf5 -y install zenity mediainfo

	# 4. Install FileBot
	sudo dnf5 -y install filebot

	# 5. Run FileBot
	filebot -script fn:sysinfo
	exit $?
fi


# Option B: Install FileBot via DNF
if dnf --version 2> /dev/null
then
	# 0. Install dnf config-manager
	sudo dnf -y install 'dnf-command(config-manager)'

	# 1. Add repository
	sudo dnf -y config-manager --add-repo 'https://raw.githubusercontent.com/filebot/plugins/master/yum/main.repo'

	# 2. Enable repository
	sudo dnf -y config-manager --set-enabled filebot --dump

	# 3. Install dependencies
	sudo dnf -y install zenity mediainfo

	# 4. Install FileBot
	sudo dnf -y install filebot

	# 5. Run FileBot
	filebot -script fn:sysinfo
	exit $?
fi


# Option C: Install FileBot via ZYPPER
if zypper --version 2> /dev/null
then
	# 1. Add repository
	sudo zypper --non-interactive addrepo --enable --refresh --gpgcheck --check 'https://raw.githubusercontent.com/filebot/plugins/master/yum/main.repo'

	# 2. Install dependencies
	sudo zypper --non-interactive install zenity mediainfo

	# 3. Install FileBot
	sudo zypper --non-interactive install filebot

	# 4. Run FileBot
	filebot -script fn:sysinfo
	exit $?
fi


# unknown package manager
exit 127
