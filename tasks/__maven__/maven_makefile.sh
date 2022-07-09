# tasks/makefile.sh
function btask.maven_makefile.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_makefile"

        return $( b.get "iprj.config.help_message" )
    else
        echo :makefile:

        echo Arg: "$1"
    fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
