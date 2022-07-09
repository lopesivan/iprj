# tasks/beans.sh
function btask.new_beans.run() {
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
        cat > $template_file <<EOF
version: 1.4

dir: out

Class:
  name: Pessoa
  attributes:                # Atributos
    - nome: String
    - sobrenome: String
    - ativa: boolean
EOF
    } || {
        local template_file="init.yml"
        local template_name="$template_file"

        tput bold tput setb 3
        echo -n "-> "
        tput setaf 2
        echo "$template_name"
        tput sgr0
        cat > $template_file <<EOF
version: 1.4

dir: out

Class:                       # Classe:
  name: Pessoa               # Nome da Classe
  attributes:                # Atributos:
    - nome: String           # Primeiro atributo \`nome:tipo'
    - sobrenome: String
    - ativa: boolean
EOF
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
    templates[1]="${HOME}/developer/template-code/w-java-beans"

    number=1
    DIR=${templates[$number]}/w/v
    APP=${DIR}/app.py
    cmd="python ${APP}"

    case $1 in
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
