# tasks/java.sh
function btask.maven_java.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_java"

        return $( b.get "iprj.config.help_message" )
    fi

    echo :java:
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
