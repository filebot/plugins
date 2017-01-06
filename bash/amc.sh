#!/bin/sh -xu
filebot -script fn:amc --output "$HOME/Media" --action duplicate --conflict skip -non-strict --log-file amc.log --def excludeList=".excludes" unsorted=y music=y artwork=y "$@"
