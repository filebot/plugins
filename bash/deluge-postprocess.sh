#!/bin/sh
TORRENT_ID="$1"
TORRENT_NAME="$2"
TORRENT_PATH="$3"

filebot -script fn:amc --output "$HOME/Media" --action duplicate --conflict skip -non-strict --log-file amc.log --def excludeList=amc.excludes unsorted=y music=y artwork=y "ut_dir=$TORRENT_PATH/$TORRENT_NAME" "ut_kind=multi" "ut_title=$TORRENT_NAME"
