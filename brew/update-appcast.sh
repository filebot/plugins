#!/bin/sh

URL='https://app.filebot.net/update.xml'
SHA=`curl --compressed --location --silent "$URL" | shasum --algorithm 256 | cut -d' ' -f 1`

sed -i '' -E "s/checkpoint: '.+'/checkpoint: '$SHA'/g" filebot.rb
