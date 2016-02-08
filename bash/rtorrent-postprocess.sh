#!/bin/sh

# rtorrent.rc
# system.method.set_key=event.download.finished,filebot,"execute={rtorrent-postprocess.sh,$d.get_base_path=,$d.get_name=,$d.get_custom1=}"

TORRENT_PATH="$1"
TORRENT_NAME="$2"
TORRENT_LABEL="$3"

filebot -script fn:amc --output "$HOME/Media" --action duplicate --conflict skip -non-strict --log-file amc.log --def excludeList=.excludes unsorted=y music=y artwork=y "ut_dir=$TORRENT_PATH" "ut_kind=multi" "ut_title=$TORRENT_NAME" "ut_label=$TORRENT_LABEL" &
