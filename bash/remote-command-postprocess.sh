#!/bin/sh -xu

# Input Parameters
ARG_PATH="$1"
ARG_NAME="$2"
ARG_LABEL="$3"

# Configuration
CONFIG_OUTPUT="$HOME/Media"

# Remote Command Configuration
NODE_HOST="username:password@172.17.0.1"


curl "http://$NODE_HOST:5452/command" --data "
-script
fn:amc
--output
$CONFIG_OUTPUT
--action
duplicate
--conflict
skip
-non-strict
--log-file
amc.log
--def
skipExtract=y
unsorted=y
music=y
artwork=y
excludeList=.excludes
ut_dir=$ARG_PATH
ut_kind=multi
ut_title=$ARG_NAME
ut_label=$ARG_LABEL
"
