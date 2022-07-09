# tasks/c.sh
function btask.update_c.run() {
    if [ "$1" == '--help' ]; then
        echo Mensagem de ajuda update c

        return $( b.get "iprj.config.help_message" )
    fi

    echo :c:
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
