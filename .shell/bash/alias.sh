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
