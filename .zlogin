# Execute code that does not affect the current session in the background.
# Stolen from https://github.com/sorin-ionescu/prezto/blob/master/runcoms/zlogin
{
    # Compile the completion dump to increase startup speed.
    zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
    if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
        zcompile "$zcompdump"
    fi
} &!

echo "Welcome Back!"
