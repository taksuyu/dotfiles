# unique items in path
typeset -U path

function add_existing_path()
{
    if [[ -d $1 ]]
    then
	path=($1 $path)
    fi
}

# user programs
USER_BIN="~/.bin"
if add_existing_path $USER_BIN
then
    export USER_BIN
fi

# cabal
add_existing_path ~/.cabal/bin

# node
add_existing_path ~/node_modules/.bin
