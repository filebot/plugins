#!/bin/sh -xu

PKG_URL="https://get.filebot.net/filebot/latest/FileBot_Subtitles.pkg"
PKG="/tmp/FileBot_Subtitles.pkg"
APP="/Applications/FileBot Subtitles.app"

function fetch {
	curl --fail --location --output "$1" --time-cond "$1" --retry 5 "$2"
}

function verify {
	pkgutil --check-signature "$1" && spctl --assess --verbose --ignore-cache --no-cache --type install "$1"
}

function install {
	sudo installer -verbose -package "$1" -target LocalSystem
}

fetch "$PKG" "$PKG_URL" && verify "$PKG" && install "$PKG" && open --reveal "$APP"
