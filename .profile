export LANG=en_GB.UTF-8

if [ -n "$BASH_VERSION" ] ; then
    if [ -f "$HOME/.bashrc" ] ; then
        . "$HOME/.bashrc"
    fi
fi
