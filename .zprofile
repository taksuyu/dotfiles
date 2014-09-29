# Stolen from https://github.com/sorin-ionescu/prezto/blob/master/runcoms/zprofile
if [[ ! -d "$TMPDIR" ]]; then
    export TMPDIR="/tmp/$USER"
    mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
fi
