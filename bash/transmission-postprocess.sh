#!/bin/sh

# Input Parameters
export OPT_PATH="$TR_TORRENT_DIR/$TR_TORRENT_NAME"
export OPT_NAME="$TR_TORRENT_NAME"
export OPT_LABEL="N/A"

# Configuration
export CONF_OUTPUT="$HOME/Media"

/usr/local/bin/filebot -script fn:amc --output "$CONF_OUTPUT" --action duplicate --conflict skip -non-strict --log-file amc.log --def unsorted=y music=y artwork=y excludeList=".excludes" ut_dir="$OPT_PATH" ut_kind="multi" ut_title="$OPT_NAME" ut_label="$OPT_LABEL"
