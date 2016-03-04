#!/bin/sh

# Input Parameters
ARG_PATH="$TR_TORRENT_DIR/$TR_TORRENT_NAME"
ARG_NAME="$TR_TORRENT_NAME"
ARG_LABEL="N/A"

# Configuration
CONFIG_OUTPUT="$HOME/Media"

/usr/local/bin/filebot -script fn:amc --output "$CONFIG_OUTPUT" --action duplicate --conflict skip -non-strict --log-file amc.log --def unsorted=y music=y artwork=y excludeList=".excludes" ut_dir="$ARG_PATH" ut_kind="multi" ut_title="$ARG_NAME" ut_label="$ARG_LABEL"
