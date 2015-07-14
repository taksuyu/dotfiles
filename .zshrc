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
    if [[ -d $1 ]]
    then
	path=( $1 $path )
    fi
}

#### Start Path ####
# unique items in path
typeset -U path

# local user programs
add_path ~/.local/bin

# cabal
add_path ~/.cabal/bin

# node
add_path ~/node_modules/.bin

# ruby
## WARNING: This breaks everytime ruby is updated.

## FIXME: Append a file with the current version if it isn't already
## in it and add all those paths.
add_path "`ruby -e 'print Gem.user_dir'`/bin"

#### Start Highlighting ####
highlight_source="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if [[ -e highlight_source ]]
then
    source highlight_source
    fpath=( /usr/share/zsh/site-functions $fpath )
fi

#### Start Alias ####
# FIXME: I should turn this whole section into fpath functions so that
# they get loaded lazily. I could abuse this along with some fancy
# loading mechanics.

# launchers
alias e='$EDITOR'

# file listing
alias ls='ls --color'
alias la='ls -a'
alias l.='ls -d .*'
alias ll='la -l'

# Lock computer, disable monitor, and turn dpms off again on resume
#alias monoff='xset dpms force off && slock && xset -dpms'

# dateformat
alias dateiso='date -u --iso-8601="seconds"'

# sprunge
alias sprunge='curl -F "sprunge=<-" http://sprunge.us'

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
