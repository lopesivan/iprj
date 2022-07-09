# tasks/python.sh
function btask.maven_python.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_python"

        return $( b.get "iprj.config.help_message" )
    fi

    echo :python:
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
