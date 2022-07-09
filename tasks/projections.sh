# tasks/projections.sh
function btask.projections.run() {

    if [ "$1" == '--help' ]; then
        #'<,'>!fmt -w 60   formatador
        cat <<-EOF
---------------------------------------------------
Lista catálogo

    Usage: $(b.get "iprj.config.name") '[filetype]'

Exemplo

    iprj projections python
EOF
    return $( b.get "iprj.config.help_message" )

    fi

    if [[ $# -lt 1 ]]; then
        iprj projections --help
    else
        local filetype=$1
        local template_file="projections.json"
        local template_name=".projections.json"

        # if exist file `_f' then remove.
        _f="$(dirname $(readlink -f $(which iprj)))/model/${filetype}/$template_file"
        if test -e $_f; then

            tput bold tput setb 3
            echo -n "-> "
            tput setaf 2
            echo "$template_name"
            tput sgr0

            cp $_f "$LOCALPATH/$template_name"
        else
            tput bold tput setb 3
            echo -n "-> "
            tput setaf 2
            echo "[$template_name] ARQUIVO NÃO ENCONTRADO"
            tput sgr0
        fi

    fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
