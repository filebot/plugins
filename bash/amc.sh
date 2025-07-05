#!/bin/sh -xu
filebot -script fn:amc -non-strict \
  --output "$HOME/Media" \
  --log-file amc.log \
  --action duplicate \
  --conflict skip \
  --def excludeList=".excludes" unsorted=y music=y artwork=y \
  --mode interactive \
  "$@"
