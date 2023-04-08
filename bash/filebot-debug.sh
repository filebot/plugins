#!/bin/sh

# use ~/filebot.debug.sh.log by default
LOG="$HOME/$(basename -- $0).log"

(
	# print custom header to confirm that we have been called
	echo "-------------------- RUN $0 (PID: $$) -------------------- $(date)"
	echo "Console Log: $LOG"
	# run filebot and pass through the given argument array (with debug logging enabled so that we can see the environment variables and the argument array in the console output)
	FILEBOT_OPTS="-Dnet.filebot.logging.debug=INFO" filebot "$@"
	# print custom trailer to print the exit code of the filebot command
	echo "Exit Code: $?"
) >> "$LOG" 2>&1
