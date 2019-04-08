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
                echo "----------"
done


# inotifywait  --exclude *~ -e modify /work | awk '$3 ~/\.(tex|md.?)$/ {system("ls " $3)}'
#/work/$TEXFILE)}'

#"context /work/$@"
