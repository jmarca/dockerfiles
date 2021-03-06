#!/bin/bash
[ "$DEBUG" = "true" ] && set -x
set -e
set -o pipefail

export JEKYLL_HOME=/opt/jekyll
export JEKYLL_BIN=$JEKYLL_HOME/bin
export PATH="$JEKYLL_BIN:$PATH"


handle_signal() {
  PID=$!
  echo "Received signal. PID is ${PID}"
  kill -s SIGHUP $PID
}

trap "handle_signal" SIGINT SIGTERM SIGHUP

# --
: ${JEKYLL_UID:=$(id -u jekyll)}
: ${JEKYLL_GID:=$(id -g jekyll)}
# --
export JEKYLL_UID
export JEKYLL_GID

# # --
# # Users can customize our UID's to fit their own so that
# #   we don't have to chown constantly.  Well it's not like
# #   we do so much of it (anymore) it's slow, but we do
# #   change permissions which can result in some bad
# #   behavior on OS X.
# # --
# if [ "$JEKYLL_UID" != "0" ] && [ "$JEKYLL_UID" != "$(id -u jekyll)" ]; then
#   usermod  -u $JEKYLL_UID jekyll
#   groupmod -g $JEKYLL_GID jekyll
#   chown_args=""

#   [ "$FULL_CHOWN" ] && chown_args="-R"
#   for d in "$JEKYLL_DATA_DIR" "$JEKYLL_VAR_DIR"; do
#     chown $chown_args jekyll:jekyll "$d"
#   done
# fi

# # --
echo "$(ruby --version)"
exec "$@"
