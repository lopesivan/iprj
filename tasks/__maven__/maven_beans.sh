# tasks/beans.sh
function btask.beans.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_beans"

        return $( b.get "iprj.config.help_message" )
    fi

    echo :beans:
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
