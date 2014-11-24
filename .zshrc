autoload -U compinit promptinit

# opts
setopt auto_cd
setopt complete_aliases
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# history
HISTFILE=~/.histfile
HISTSIZE=50
SAVEHIST=50

# git file completion
function __git_files
{
    _wanted files expl 'local files' _files
}

# init
for script in `find ~/.shell`
do
    if [[ ! -d $script && ${script##*.} =~ (zsh|sh) ]]
    then
        source $script
    fi
done
compinit
