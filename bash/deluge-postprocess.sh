#!/bin/sh -xu

# Input Parameters
ARG_PATH="$3/$2"
ARG_NAME="$2"
ARG_LABEL="N/A"

# Configuration
CONFIG_OUTPUT="$HOME/Media" # if this script is called by the deluge user, then $HOME will NOT refer to YOUR user home, but paths such as /var/lib/deluge instead

filebot -script fn:amc --output "$CONFIG_OUTPUT" --action duplicate --conflict skip -non-strict --log-file amc.log --def unsorted=y music=y artwork=y excludeList=".excludes" ut_dir="$ARG_PATH" ut_kind="multi" ut_title="$ARG_NAME" ut_label="$ARG_LABEL"
