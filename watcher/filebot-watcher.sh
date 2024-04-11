#!/bin/sh

SETTLE_DOWN_TIME="300"
SETTLE_DOWN_CHECK="5 seconds ago"


inotifywait --monitor "$1" --event create --event moved_to --event modify --exclude '/[.@]' --format '%w%f' $INOTIFYWAIT_OPTS | stdbuf -oL uniq | while read -r FILE; do
	TODAY="$(date '+%Y/%m/%d %H:%M:%S %Z')"

	echo "[INOTIFY] $FILE"

	# make sure to inform the user that we are waiting for things to settle down
	echo "[$TODAY] Waiting $SETTLE_DOWN_TIME seconds for changes to settle down..."

	# file may yield inode/x-empty for new files
	sleep "$SETTLE_DOWN_TIME"

	# abort if the file is currently being written (i.e. network copy operations can take minutes or hours)
	RECENTLY_MODIFIED_FILES="$(find "$1" -type f -newermt "$SETTLE_DOWN_CHECK" -not -path '*/[.@]*' -print -quit)"

	if [ -n "$RECENTLY_MODIFIED_FILES" ]; then
		echo "[$TODAY] $RECENTLY_MODIFIED_FILES was modified less than $SETTLE_DOWN_CHECK"
		echo "Processing deferred until next change..."
		continue
	fi

	# e.g. video.mp4: video/mp4
	if file --mime-type "$FILE" | egrep --quiet "directory|video|audio|empty|octet-stream"; then
		filebot -script fn:amc --action duplicate --conflict auto -non-strict --log-file amc.log --def excludeList=".excludes" unsorted=y music=y artwork=y "$@"
	else
		echo "Ignore: $(file --mime-type "$FILE")"
	fi
done
