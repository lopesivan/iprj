# tasks/new.sh

function btask.new.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_new"

        return $( b.get "iprj.config.help_message" )
    else
        if [[ $# -lt 1 ]]; then
            ls $(b.get bang.working_dir)/tasks/__new__| xargs -l1 |sed -e 's/^new_//' -e 's/\.sh$//'
        else
            b.task.run "new_$@"

        fi
    fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
