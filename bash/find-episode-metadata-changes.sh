#!/bin/sh -xu
filebot -mediainfo \
  --file-filter 'f.video' \
  --filter 'episode && none{ episode as String == episodelist.find{ it.episode == episode }.episode as String }' \
  --format '{episode} | {episodelist.find{ it.episode == episode }.episode} | {f}' \
  -r "$@"
