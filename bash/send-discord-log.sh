#!/bin/sh -u


# Usage:
# ./send-discord-log.sh filebot -script fn:sysinfo


# required user configuration
DISCORD_WEBHOOK_URL="<Copy Webhook URL>"

# use command as task name
TASK_NAME="$1"
GREP_LINES="^\W|^Fail|^Skip"


# create temporary files
MSG_FILE=$(mktemp)
LOG_FILE=$(mktemp)

# delete temporary files on exit
function finish {
	rm "$LOG_FILE" "$MSG_FILE"
}
trap finish EXIT


# run command and capture console output
(time "$@") > "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
	STATUS="OK"

	# post to Discord only if the command failed (disabled by default)
	# exit 0
else
	STATUS="FAILURE"
fi

echo '```' >> "$MSG_FILE"
echo "
$STATUS | $@
----------------------------------------
$(egrep "$GREP_LINES" "$LOG_FILE")
" | head -c 1990 >> "$MSG_FILE"
echo '```' >> "$MSG_FILE"

# print raw message
# cat "$MSG_FILE"

# post to discord
curl \
	--form "username=$TASK_NAME" \
	--form "content=<$MSG_FILE" \
	--form "file=@$LOG_FILE;type=text/plain;filename=$TASK_NAME.log" \
	"$DISCORD_WEBHOOK_URL"
