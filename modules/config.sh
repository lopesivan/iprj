# modules/config.sh

function iprj.config.load () {

    b.unset 'iprj.config'

    _iprj.config.load_default_config

    return $?
}

function _iprj.config.load_from_file () {

    local file="$1"

    local number_of_tasks=$(cat $file | jq '.iprj[] .start' | wc -l)
    let number_of_tasks--
    for i in `seq 0 $number_of_tasks`; do

        local command=$(cat $file |
            jq --raw-output ".iprj[$i].command")

        local description=$(cat $file |
            jq --raw-output ".iprj[$i].description")

        b.set "iprj.config.help_message_$command" "$description"
    done

    local name=$(cat $file | jq --raw-output ".id.name")

    local version=$(cat $file | jq --raw-output ".id.version")

    b.set "iprj.config.name" "$name"
    b.set "iprj.config.version" "$version"
    b.set "iprj.config.author" "`git config --get user.name`"
    b.set "iprj.config.email"  "`git config --get user.email`"

}

function _iprj.config.load_default_config () {

    b.set "iprj.config.help_message" '2'

    local file="$(dirname $(readlink -f $(which iprj)))/etc/iprjdoc.json"

    if [ -n "$file" ]; then                   # se variavel nao nula
        if [ -e "$file" ]; then               # se arquivo existe
            _iprj.config.load_from_file "$file" # carrega arquivo

            return $?
        else
            b.raise FileNotFoundException     # se arquivo nao encontrado
        fi
    else
        b.raise StringIsNullException         # se a variavel e nula
    fi

    return 1
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
