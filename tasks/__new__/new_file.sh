# tasks/new_file.sh
function btask.new_file.run() {

    local template="$(brew --prefix)/opt/template-code/w-new-file"

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
    iprj new file helloworld c
    iprj new file helloworld cpp
    iprj new file helloworld tex
    iprj new file tictac c
    iprj new file tictac cpp
    iprj new file save tictac cpp
    iprj new file save helloworld tex
    iprj new file save helloworld c

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
        echo "cmd: { 'name': helloworld, 'dir': . }" >  $template_name
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

##############################################################################

    if [ "$1" == '--help' ]; then
        _usage
        echo kkkk
        return $( b.get "iprj.config.help_message" )
    fi

    if [ "$1" == '--list' ]; then

        DIR=${template}/w/v
        APP=${DIR}/app.py
        cd $LOCALPATH
        python ${APP} -y init.yml kiko

        return 0
    fi

    cd $LOCALPATH

    DIR=${template}/w/v
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
