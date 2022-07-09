# tasks/file.sh
function btask.new_file.run() {

# Descrição de como usar `new_c'
_usage()
{
#'<,'>!fmt -w 60   formatador
cat <<-EOF
Usage: iprj new makefile [options] [word]...

options
    yml   - Gera YML de inicializaçao do template CHEETAH
    save  - Salva o processamento em arquivo

examples:
    iprj  new file helloworld c
    iprj  new file helloworld cpp
    iprj  new file helloworld tex
    iprj  new file tictac c
    iprj  new file tictac cpp
    iprj  new file save tictac cpp
    iprj  new file save helloworld tex
    iprj  new file save helloworld c


EOF
}

# Salva parseando o arquivo `yml' presente no diretório corrente.
_save()
{
    [ "$1" ] && {
        opt="-s -y init.yml $1 $2"
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
    echo "cmd:     { 'name': helloworld, 'dir': .  }" >  $template_name
}

# imprime na tela os arquivos gerados se existir o arquivo de configuracao
# 'init.yml'
_parser()
{

    [ $1 ] && {
        opt="-p -y init.yml $1 $2"
    }

    $cmd $opt

}

_list()
{
    cat<<EOF| fzf
    CMakeLists.txt
    Dockerfile
    Makefile
    pubspec.yaml
    tsconfig.json
    Cargo.toml
    .projections.json
    .gitignore
    .local.vimrc
    .ccls
    .ccls-root
EOF

}

##############################################################################

    if [ "$1" == '--help' ]; then
        _usage
        return $( b.get "iprj.config.help_message" )
    fi

    if [ "$1" == '--list' ]; then
        f=$(_list)

        cd $LOCALPATH
        test -z $f || { echo NEW:$f; > $f; }

        return 0
    fi

    cd $LOCALPATH

    declare -A templates
    templates[1]="${HOME}/developer/template-code/w-new-file"

    number=1
    DIR=${templates[$number]}/w/v
    APP=${DIR}/app.py
    cmd="python ${APP}"

    case $1 in
        'save')
            _save $2 $3
            ;;
        'yml')
            _yml $2
            ;;
        'init')
            _yml $2
            ;;
        *)
            _parser $1 $2
            ;;
    esac

} # end
# vim: set ts=4 sw=4 tw=78 ft=sh:
