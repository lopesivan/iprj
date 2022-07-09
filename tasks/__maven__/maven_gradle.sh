# tasks/gradle.sh
function btask.maven_gradle.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_gradle"

        return $( b.get "iprj.config.help_message" )
    else
        echo :gradle:

        echo Arg: "$1"
    fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
