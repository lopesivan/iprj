# tasks/autotools.sh
function btask.update_autotools.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_autotools"

        return $( b.get "iprj.config.help_message" )
    fi

    echo :autotools:
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
