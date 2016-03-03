#!/bin/sh

# Input Parameters
export OPT_PATH="$NZBPP_DIRECTORY"
export OPT_NAME="$NZBPP_NZBNAME"
export OPT_LABEL="$NZBPP_CATEGORY"

# Configuration
export CONF_OUTPUT="$HOME/Media"

filebot -script fn:amc --output "$CONF_OUTPUT" --action duplicate --conflict skip -non-strict --log-file amc.log --def unsorted=y music=y artwork=y excludeList=".excludes" ut_dir="$OPT_PATH" ut_kind="multi" ut_title="$OPT_NAME" ut_label="$OPT_LABEL"

# NZBGet Exit Codes
if [ $? = 0 ]; then
	exit 93 # SUCCESS
else
	exit 94 # FAILURE
fi
