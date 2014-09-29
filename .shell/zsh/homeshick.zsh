if [[ -d "$HOME/.homesick" ]]; then
    # Homeshick ( https://github.com/andsens/homeshick )
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
    fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
fi
