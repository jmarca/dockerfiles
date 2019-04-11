#!/bin/bash
set -e

if [ -z "$TEXFILE" ]; then
	echo >&2 'error: missing TEXFILE environment variable'
	echo >&2 '  try running again with -e TEXFILE=<your context master file>'
	exit 1
fi
echo "TEXFILE is $TEXFILE"
PROCESS="/work/${TEXFILE}"
ls ${PROCESS}

# context /work/$TEXFILE
while [ 1 ]; do
                inotifywait --exclude *~ -e modify . | awk -v report=$PROCESS '$3 ~/\.(tex|md.?)$/ {system("context " report )}'
                echo "---------- context done, looping ----------"
done

# not sure why the following doesn't work.  It works from slackware,
# but not from within docker container.  I dunno

# inotifywait -m --exclude *~ -e modify . | awk -v report=$PROCESS '$3 ~/\.(tex|md.?)$/ {system("context " report )}'



#"context /work/$@"
