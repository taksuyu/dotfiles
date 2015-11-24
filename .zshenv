################################################################################
# Env
################################################################################

export BROWSER='firefox'
export EDITOR='nano'
export PAGER='less'
#export MAILDIR='~/Maildir'

# GPG
export GNUPGHOME="~/.gnupg"

################################################################################
# Functions
################################################################################
# TODO: I may be able to pull these functions out, but they are kind of
# necessary at the earliest convienence.

# Does the command exist?
function IFCOMMAND
{
    [[ -x $(command -v $@) ]]
}

function add_path
{
    for dir in $@; do if [[ -d $dir ]]; then path=( $dir $path ) fi; done
}

################################################################################
# Path
################################################################################

# Only allow a directory be added to path if it isn't already on the path.
typeset -U path

# Local user programs FIXME: Should be the only path I have to add.
add_path ~/.local/bin

# stack ghc's TODO: May not be necessary anymore?
if IFCOMMAND stack
then
    # Because I'm using an automcompletion feature here, it can break
    add_path $(printf '%s\n' ~/.stack/programs/*/ghc-*/bin/)
fi

# Cabal TODO: Outdated, I should remove.
if IFCOMMAND cabal
then
    add_path ~/.cabal/bin
fi

# NPM TODO: Don't really use this anymore, but I suppose it still serves
# purpose.
if IFCOMMAND npm
then
    add_path ~/node_modules/.bin
fi

# Ruby WARNING: This is just so broken I can't even. FIXME: Append a file with
# the current version if it isn't already in it and add all those paths.
if IFCOMMAND ruby
then
    add_path "`ruby -e 'print Gem.user_dir'`/bin"
fi
