# Env launcher
alias e='$EDITOR'

# Navigation
#alias _='sudo'  # FIXME: Doesn't complete commands through zsh
#alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls --color'
alias la='ls -a'
alias l.='ls -d .*'
alias ll='la -l'

# Lock computer, disable monitor, and turn dpms off again on resume
alias monoff='xset dpms force off && slock && xset -dpms'

alias scrot='scrot -e "mv $f ~/scrot"'

# vcsh
alias dots='vcsh dotfiles status --untracked-files=no -bs'
alias dotc='vcsh dotfiles commit'
alias dotp='vcsh dotfiles push'

# cabal
alias cb='cabal build'
alias ccb='clear; cabal build'
alias cr='cabal run'
