# tasks/maven.sh

function btask.maven.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_maven"

        return $( b.get "iprj.config.help_message" )
    else
        if [[ $# -lt 1 ]]; then
            ls $(b.get bang.working_dir)/tasks/__maven__| xargs -l1 |sed -e 's/^maven_//' -e 's/\.sh$//'
        else
            b.task.run "maven_$@"

        fi
    fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
