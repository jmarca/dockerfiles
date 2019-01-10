#!/bin/bash
set -e

# source /opt/context/tex/setuptex
inotifywait -m -e modify . | awk '$3 ~ /\.tex/ {system("context ")}'

"context /home/user/$@"
