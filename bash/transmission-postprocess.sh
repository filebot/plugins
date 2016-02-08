#!/bin/sh
/usr/local/bin/filebot -script fn:amc --output "$HOME/Media" --action duplicate --conflict skip -non-strict --log-file amc.log --def excludeList=.excludes unsorted=y music=y artwork=y "ut_dir=$TR_TORRENT_DIR/$TR_TORRENT_NAME" "ut_kind=multi" "ut_title=$TR_TORRENT_NAME"
