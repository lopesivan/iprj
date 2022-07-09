# tasks/cpp.sh
function btask.update_cpp.run() {
    if [ "$1" == '--help' ]; then
        echo Mensagem de ajuda update cpp

        return $( b.get "iprj.config.help_message" )
    fi

    echo :update:
    echo :cpp:
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
