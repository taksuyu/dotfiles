promptinit
prompt walters

# Zsh completion and highlighting
if [[ -e "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]
then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fpath=(/usr/share/zsh/site-functions $fpath)
fi

#bindkey -e
