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
alias ls="ls --color"
alias la="ls -a"
alias l.="ls -d .*"
alias ll="la -l"

# Lock computer, disable monitor, and turn dpms off again on resume
#alias monoff='xset dpms force off && slock && xset -dpms'

# dateformat
alias dateiso="date -u --iso-8601=\"seconds\""

{
    # pacman
    if IFCOMMAND pacman
    then
        alias pac="sudo pacman"
        alias paci="pac -S"
        alias pacu="pac -Syu"
        alias pacs="pac -Ss"
        alias pacq="pac -Qi"
    fi

    # pacaur
    if IFCOMMAND pacaur
    then
        # overwrite pacman's base alias
        alias pac="pacaur"
    fi

    if IFCOMMAND apt
    then
        alias apt="sudo apt"
    fi
}
{
    # vcsh
    if IFCOMMAND vcsh
    then
        local v="vcsh"
        alias dots="$v dotfiles status --untracked-files=no -bs"
        alias dotc="$v dotfiles commit"
        alias dotp="$v dotfiles push"
        alias dotd="$v dotfiles diff"
        alias dota="$v dotfiles add"
    fi
}
{
    # cabal
    if IFCOMMAND cabal
    then
        local c="cabal"
        alias ci="$c install -j --enable-tests"
        alias cio="ci --only-dependencies"
        alias ch="$c haddock"
        alias ct="$c test"
        alias cb="$c build"
        alias ccb="clear; $c build"
        alias cr="$c run"
    fi
}
{
    # stack
    if IFCOMMAND stack
    then
        local s="stack"
        alias si="$s install"
        alias sb="$s build"
        alias sbh="sb --haddock"
        alias sbt="sb --test"
        alias sba="sb --haddock --test"
        alias se="$s exec"
        alias st="$s test"
    fi
}
{
    # git
    if IFCOMMAND git
    then
        local g="git"
        alias gi="$g init"
        alias gcl="$g clean"
        alias gco="$g commit"
        alias ga="$g add"
        alias gpl="$g pull"
        alias gplr="gpl --rebase"
        alias gps="$g push"
        alias gst="$g status"
        alias gch="$g checkout"
    fi
}

################################################################################
# Environment
################################################################################

# Archlinux's AUR puts android studio here
ANDROID_HOME=/opt/android-sdk

if [[ -d $ANDROID_HOME ]]
then
    export ANDROID_HOME
fi
