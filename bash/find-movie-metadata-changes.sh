#!/bin/sh -xu
filebot -mediainfo -r "$@" \
	--file-filter 'f.video' \
	--filter 'movie && none{ n == info.name && y == info.released.year }' \
	--format '{n} | {y} | { info.name } | { info.released.year } | {f}'
