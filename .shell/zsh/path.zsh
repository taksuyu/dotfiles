# unique items in path
typeset -U path

function add_existing_path()
{
    if (( -d $1 ))
    then
	path=($1 $path)
    fi
}

# user programs
export USER_BIN="~/.bin"
add_existing_path $USER_BIN

# cabal
add_existing_path ~/.cabal/bin

# node
add_existing_path ~/node_modules/.bin
