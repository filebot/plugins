#!/bin/sh -xu


VERSION=4.9.6


if [ $(uname -m) = arm64 ]; then
	URL="https://get.filebot.net/filebot/FileBot_${VERSION}/FileBot_${VERSION}_arm64.pkg"
else
	URL="https://get.filebot.net/filebot/FileBot_${VERSION}/FileBot_${VERSION}_x64.pkg"
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
