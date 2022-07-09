# tasks/cpp.sh
function btask.new_cpp.run() {


# Descrição de como usar `new_c'
_usage()
{
#'<,'>!fmt -w 60   formatador
cat <<-EOF
Usage: iprj new cpp [OPTION]...

OPTIONS
    ccls  - Gera os arquivos ‘.ccls’ e ‘.ccls-root’ de controle
    yml   - Gera YML de inicializaçao do template CHEETAH
    save  - Salva o processamento em arquivo
    cmake - Gera ‘CMakeLists.txt’ para c++
    json  - Gera o prquivo ‘.projections.json’

EOF
}

# Gera o prquivo .projections.json
_json()
{
    [ $1 ] && {
        opt="-s -y ${1}.yml"
    } || {
        opt="-s -y init.yml"
    }

    for f in projections.json; do
        local template_file="$f"
        local template_name=".$template_file"

        tput bold tput setb 3
        echo -n "-> "
        tput setaf 2
        echo "$template_name"
        tput sgr0
    done

    APP=${DIR}/app_json.py
    cmd="python ${APP}"

    $cmd $opt
}

# Gera CMakeLists.txt para cansi
_cmake()
{
    [ $1 ] && {
        opt="-s -y ${1}.yml"
    } || {
        opt="-s -y init.yml"
    }

    for f in CMakeLists.txt; do
        local template_file="$f"
        local template_name="$template_file"

        tput bold tput setb 3
        echo -n "-> "
        tput setaf 2
        echo "$template_name"
        tput sgr0
    done

    APP=${DIR}/app_cmake.py
    cmd="python ${APP}"

    $cmd $opt
}

# Gera .ccls para cansi
_ccls()
{
    [ $1 ] && {
        opt="-s -y ${1}.yml"
    } || {
        opt="-s -y init.yml"
    }

    for f in ccls ccls-roor; do
        local template_file="$f"
        local template_name=".$template_file"

        tput bold tput setb 3
        echo -n "-> "
        tput setaf 2
        echo "$template_name"
        tput sgr0
    done

    APP=${DIR}/app_ccls_root.py
    cmd="python ${APP}"

    $cmd $opt
}

# Salva parseando o arquivo `yml' presente no diretório corrente.
_save()
{
    [ $1 ] && {
        opt="-s -y ${1}.yml"
    } || {
        opt="-s -y init.yml"
    }

    $cmd $opt
}

# Gera o arquivo template `yml' com os inputs necessários ao template CHEETAH.
_yml()
{
    [ $1 ] && {
        local template_file="${1}.yml"
        local template_name="$template_file"

        tput bold tput setb 3
        echo -n "-> "
        tput setaf 2
        echo "$template_name"
        tput sgr0
        echo "cmd:     { 'name': name, 'dir':  out  }" >  $template_name
        echo "unicode: { 'at': '@',    'arrow': 'H' }" >> $template_name
    } || {
        local template_file="init.yml"
        local template_name="$template_file"

        tput bold tput setb 3
        echo -n "-> "
        tput setaf 2
        echo "$template_name"
        tput sgr0
        echo "cmd:     { 'name': name, 'dir':  out  }" >  $template_name
        echo "unicode: { 'at': '@',    'arrow': 'H' }" >> $template_name
    }
}

# imprime na tela os arquivos gerados se existir o arquivo de configuracao
# 'init.yml'
_parser()
{
    [ $1 ] && {
        opt="-p -y ${1}.yml"
    } || {
        opt="-p -y init.yml"
    }

    $cmd $opt
}

##############################################################################

    if [ "$1" == '--help' ]; then
        _usage
        return $( b.get "iprj.config.help_message" )
    fi

    cd $LOCALPATH

    declare -A templates
    templates[1]="${HOME}/developer/template-code/w-new-cpp"

    number=1
    DIR=${templates[$number]}/w/v
    APP=${DIR}/app.py
    cmd="python ${APP}"

    case $1 in
        'json')
            _json $2
            ;;
        'cmake')
            _cmake $2
            ;;
        'ccls')
            _ccls $2
            ;;
        'save')
            _save $2
            ;;
        'yml')
            _yml $2
            ;;
        'init')
            _yml $2
            ;;
        *)
            _parser
            ;;
    esac


} # end
# vim: set ts=4 sw=4 tw=78 ft=sh:
