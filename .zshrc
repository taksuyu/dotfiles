#### Start Prompt ####
fpath=( "$HOME/.zfunctions" $fpath )
autoload -U compinit promptinit

compinit
promptinit

PURE_PROMPT_SYMBOL=λ

prompt pure

#### Start Functions ####
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

#### Start Path ####
# unique items in path
typeset -U path

# local user programs
add_path ~/.local/bin

# stack ghc's
add_path ~/.stack/programs/x86_64-linux/ghc-*/bin

# ruby
## WARNING: This breaks everytime ruby is updated.

## FIXME: Append a file with the current version if it isn't already
## in it and add all those paths.
add_path "`ruby -e 'print Gem.user_dir'`/bin"

#### Start Highlighting ####
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=( /usr/share/zsh/site-functions $fpath )

#### Start Alias ####
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
if [[ -x =pacman ]]
then
    alias pac='sudo pacman'
fi

# vcsh
if [[ -x =vcsh ]]
then
    alias dots='vcsh dotfiles status --untracked-files=no -bs'
    alias dotc='vcsh dotfiles commit'
    alias dotp='vcsh dotfiles push'
    alias dotd='vcsh dotfiles diff'
    alias dota='vcsh dotfiles add'
fi

# cabal
if [[ -x =cabal ]]
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
if [[ -x =git ]]
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
if [[ -x =make ]]
then
    alias make='make --quiet'
fi

ANDROID_HOME=/opt/android-sdk
if [[ -d $ANDROID_HOME ]]
then
    export ANDROID_HOME
fi
