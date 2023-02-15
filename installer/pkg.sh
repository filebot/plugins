#!/bin/sh -xu

VERSION=4.9.6
ARCH=$(uname -m)
URL="https://get.filebot.net/filebot/FileBot_${VERSION}/FileBot_${VERSION}_${ARCH}.pkg"
PKG="${TMPDIR}FileBot_${ARCH}.pkg"
APP="/Applications/FileBot.app"


function fetch {
	curl --verbose --fail --location --output "$1" --time-cond "$1" --retry 5 "$2"
}

function verify {
	pkgutil --check-signature "$1" && spctl --assess --verbose --ignore-cache --no-cache --type install "$1"
}

function install {
	sudo rm -vrf /Applications/FileBot.* ~/Applications/FileBot.*
	sudo installer -verbose -package "$1" -target LocalSystem
}


fetch "$PKG" "$URL" && verify "$PKG" && install "$PKG" && open --reveal "$APP"
