function cd
{
    builtin cd $1 && ls
}

function shelledit
{
    set -A ZLOGIN_SUM `sha512sum ~/.zlogin`
    set -A ZSHENV_SUM `sha512sum ~/.zshenv`
    set -A ZSHRC_SUM `sha512sum ~/.zshrc`
    set -A ZPROFILE_SUM `sha512sum ~/.zprofile`

    $EDITOR -c "OpenSession shelledit"

    function compile
    {
        set -A FILE_SUM `sha512sum $2`

        # $1 is only the first argument of the array
        if [[ $1 != $FILE_SUM[1] ]]
        then
            zcompile $2
            echo "Compiling $2"
        fi
    }
    compile $ZLOGIN_SUM ~/.zlogin
    compile $ZSHENV_SUM ~/.zshenv
    compile $ZSHRC_SUM ~/.zshrc
    compile $ZPROFILE_SUM ~/.zprofile
}
