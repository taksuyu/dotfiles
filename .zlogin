# Execute code that does not affect the current session in the background.
# Stolen from https://github.com/sorin-ionescu/prezto/blob/master/runcoms/zlogin
{
    # Compile the completion dump to increase startup speed.
    zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
    if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]
    then
        zcompile "$zcompdump"
    fi
} &!

{
    # Compile the basic files that zsh uses for configuration.
    zfiles=("$HOME/.zshrc" "$HOME/.zshenv" "$HOME/.zlogin")
    for zfile in $zfiles
    do
        if [[ -s "$zfile" && (! -s "${zfile}.zwc" || "$zfile" -nt "${zfile}.zwc") ]]
        then
            zcompile "$zfile"
        fi
    done
} &!

if [[ -e ~/doge ]]
then
    cat doge
fi
