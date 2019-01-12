#!/bin/sh

mkdir -p $HOME/bin
export PATH=$PATH:$HOME/bin

if [ "$PANDOC_OPTS" != "" ]; then
    {
        echo '#!/bin/sh'
        echo 'myprog=/bin/pandoc-default'
        echo 'exec "$myprog" "${PANDOC_OPTS}" "$@"'
    } >> "$HOME/bin/pandoc"
else
    {
        echo '#!/bin/sh'
        echo 'myprog=/bin/pandoc-default'
        echo 'exec "$myprog" "$@"'
    } >> "$HOME/bin/pandoc"
fi
chmod a+x $HOME/bin/pandoc
