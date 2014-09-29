if [[ -e ruby ]]; then
    # Bundler user install
    #! Careful because if uses the latest ruby !#
    export GEM_HOME=$(ruby -e 'puts Gem.user_dir')

    # Ruby
    path=("$GEM_HOME/bin" $path)

    # Rbenv ( https://github.com/sstephenson/rbenv )
    if [[ -d ~/.rbenv/bin ]]; then
        path=(~/.rbenv/bin $path)
        eval "$(rbenv init -)"
    fi
fi
