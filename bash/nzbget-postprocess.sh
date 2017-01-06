#!/bin/sh -xu

# Input Parameters
ARG_PATH="$NZBPP_DIRECTORY"
ARG_NAME="$NZBPP_NZBNAME"
ARG_LABEL="$NZBPP_CATEGORY"

# Configuration
CONFIG_OUTPUT="$HOME/Media"

filebot -script fn:amc --output "$CONFIG_OUTPUT" --action duplicate --conflict skip -non-strict --log-file amc.log --def unsorted=y music=y artwork=y excludeList=".excludes" ut_dir="$ARG_PATH" ut_kind="multi" ut_title="$ARG_NAME" ut_label="$ARG_LABEL"

# NZBGet Exit Codes
if [ $? = 0 ]; then
	exit 93 # SUCCESS
else
	exit 94 # FAILURE
fi
