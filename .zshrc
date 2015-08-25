################################################################################
# Prompt
################################################################################

fpath=( "$HOME/.zfunctions" $fpath )
autoload -U compinit promptinit

compinit
promptinit

PURE_PROMPT_SYMBOL=λ

prompt pure

################################################################################
# Functions
################################################################################

# If the path exists, then add it to the path
function add_path
{
    for dir in $@
    do
        if [[ -d $dir ]]
        then
            path=( $dir $path )
        fi
    done
}

# Does the command exist?
function FINDCOM
{
    [[ -x $(command -v $@) ]]
}

################################################################################
# Path
################################################################################

# Only allow a directory be added to path if it isn't already on the path.
typeset -U path

# Local user programs
# FIXME: Should be the only path I have to add.
add_path ~/.local/bin

<<<<<<< HEAD
# stack ghc's
add_path ~/.stack/programs/x86_64-linux/ghc-*/bin
=======
# Cabal
add_path ~/.cabal/bin

# NPM
add_path ~/node_modules/.bin
>>>>>>> ba8de26a84b4ee1635d26a2adf79c95c6e369511

# Ruby
## WARNING: This is just so broken I can't even.

## FIXME: Append a file with the current version if it isn't already
## in it and add all those paths.
if FINDCOM ruby
then
    add_path "`ruby -e 'print Gem.user_dir'`/bin"
fi

################################################################################
# Highlighting
################################################################################

# Archlinux's location for the highlighter script
# NOTE: Maybe I should move this to Archlinux specific feature section?
ZSH_HIGHLIGHTING_SCRIPT=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -e $ZSH_HIGHLIGHTING_SCRIPT ]]
then
    source $ZSH_HIGHLIGHTING_SCRIPT
fi

################################################################################
# Completion
################################################################################

# NOTE: Should be harmless to not make this context aware.
fpath=( /usr/share/zsh/site-functions $fpath )

################################################################################
# Aliases
################################################################################
# FIXME: I should turn this whole section into fpath functions so that
# they get loaded lazily. I could abuse this along with some fancy
# loading mechanics.

# file listing
alias ls='ls --color'
alias la='ls -a'
alias l.='ls -d .*'
alias ll='la -l'

# Lock computer, disable monitor, and turn dpms off again on resume
#alias monoff='xset dpms force off && slock && xset -dpms'

# dateformat
alias dateiso='date -u --iso-8601="seconds"'

# pacman
if FINDCOM pacman
then
    alias pac='sudo pacman'
    alias pacu='pac -Syu'
    alias pacs='pac -Ss'
    alias pacq='pac -Qi'
fi

# vcsh
if FINDCOM vcsh
then
    alias dots='vcsh dotfiles status --untracked-files=no -bs'
    alias dotc='vcsh dotfiles commit'
    alias dotp='vcsh dotfiles push'
    alias dotd='vcsh dotfiles diff'
    alias dota='vcsh dotfiles add'
fi

# cabal
if FINDCOM cabal
then
    alias ci='cabal install -j --enable-tests'
    alias cio='ci --only-dependencies'
    alias ch='cabal haddock'
    alias ct='cabal test'
    alias cb='cabal build'
    alias ccb='clear; cabal build'
    alias cr='cabal run'
fi

# stack
if [[ -x =stack ]]
then
    alias si='stack install'
    alias sb='stack build'
    alias st='stack test'
fi

# git
if FINDCOM git
then
    alias gi='git init'
    alias gcl='git clean'
    alias gco='git commit'
    alias ga='git add'
    alias gpl='git pull'
    alias gps='git push'
    alias gst='git status'
    alias gch='git checkout'
fi

# make
if FINDCOM make
then
    alias make='make --quiet'
fi

ANDROID_HOME=/opt/android-sdk
if [[ -d $ANDROID_HOME ]]
then
    export ANDROID_HOME
fi
