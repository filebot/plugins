#!/bin/sh -xu


PACKAGE_VERSION=5.1.1


if [ $(uname -m) = arm64 ]; then
	URL="https://get.filebot.net/filebot/FileBot_${PACKAGE_VERSION}/FileBot_${PACKAGE_VERSION}_arm64.pkg"
else
	URL="https://get.filebot.net/filebot/FileBot_${PACKAGE_VERSION}/FileBot_${PACKAGE_VERSION}_x64.pkg"
fi

PKG=${TMPDIR}$(basename $URL)
APP=/Applications/FileBot.app


function fetch {
	curl --verbose --fail --location --output "$1" --retry 5 "$2"
}

function verify {
	pkgutil --check-signature "$1" && spctl --assess --verbose --ignore-cache --no-cache --type install "$1"
}

function install {
	sudo rm -vrf /Applications/FileBot.* ~/Applications/FileBot.*
	sudo installer -verbose -package "$1" -target LocalSystem
}


fetch "$PKG" "$URL" && verify "$PKG" && install "$PKG" && open --reveal "$APP"
