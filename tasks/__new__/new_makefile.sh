# tasks/makefile.sh
function btask.new_makefile.run() {


# Descrição de como usar `new_c'
_usage()
{
#'<,'>!fmt -w 60   formatador
cat <<-EOF
Usage: iprj new makefile [options] [word]...

options
    yml   - Gera YML de inicializaçao do template CHEETAH
    save  - Salva o processamento em arquivo

word
    arduino         -
    arduino_profile -
    cpp             -
    cpp11           -
    vaca            -
    java            -
    maven           -
    c               -
    m               -
    s               -
    modernc         -
    so              -
    go              -
    py              -
    venv            -
    conditional     -

EOF
}

# Salva parseando o arquivo `yml' presente no diretório corrente.
_save()
{
    [ $1 ] && {
        opt="-s -y init.yml $1"
    } || {
        local f=$(cat <<-EOF |dmenu -i -l 52 -fn 'Droid Sans Mono-26' -nf green -nb black -sf black -sb white
arduino
arduino_profile
cpp
cpp11
vaca
java
maven
c
m
s
modernc
so
go
py
venv
conditional
EOF
)
        opt="-s -y init.yml $f"
    }

    $cmd $opt
}

# Gera o arquivo template `yml' com os inputs necessários ao template CHEETAH.
_yml()
{
    local template_file="init.yml"
    local template_name="$template_file"

    tput bold tput setb 3
    echo -n "-> "
    tput setaf 2
    echo "$template_name"
    tput sgr0
    echo "cmd:     { 'name': Makefile, 'dir': out  }" >  $template_name
    echo "unicode: { 'at': '@',    'arrow': 'H'    }" >> $template_name

}

# imprime na tela os arquivos gerados se existir o arquivo de configuracao
# 'init.yml'
_parser()
{

    [ $1 ] && {
        opt="-p -y init.yml $1"
    } || {
        local f=$(cat <<-EOF |dmenu -i -l 52 -fn 'Droid Sans Mono-26' -nf green -nb black -sf black -sb white
arduino
arduino_profile
cpp
cpp11
vaca
java
maven
c
m
s
modernc
so
go
py
venv
conditional
EOF
)
        opt="-p -y init.yml $f"
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
    templates[1]="${HOME}/developer/template-code/w-new-makefile"

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
            _parser $1
            ;;
    esac

} # end
# vim: set ts=4 sw=4 tw=78 ft=sh:
