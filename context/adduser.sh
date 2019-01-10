#!/bin/bash

useradd -m context
ORIGPASSWD=$(cat /etc/passwd | grep context)
ORIG_UID=$(echo $ORIGPASSWD | cut -f3 -d:)
ORIG_GID=$(echo $ORIGPASSWD | cut -f4 -d:)

sed -i -e "s/:$ORIG_UID:$ORIG_GID:/:1000:1000:/" /etc/passwd
sed -i -e "s,/bin/sh,/bin/bash,g" /etc/passwd
sed -i -e "s/developer:x:$ORIG_GID:/developer:x:1000:/" /etc/group
