# launchers
alias e='$EDITOR'

# navigation
#alias _='sudo'  # FIXME: Doesn't complete commands through zsh
alias ...='cd ../..'
alias ls='ls --color'
alias la='ls -a'
alias l.='ls -d .*'
alias ll='la -l'

# Lock computer, disable monitor, and turn dpms off again on resume
alias monoff='xset dpms force off && slock && xset -dpms'

# dateformat
alias dateiso='date -u --iso-8601="seconds"'

# vcsh
alias dots='vcsh dotfiles status --untracked-files=no -bs'
alias dotc='vcsh dotfiles commit'
alias dotp='vcsh dotfiles push'
alias dotd='vcsh dotfiles diff'

# cabal
alias cb='cabal build'
alias ccb='clear; cabal build'
alias cr='cabal run'
