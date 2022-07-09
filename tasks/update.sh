# tasks/update.sh

function btask.update.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_update"

        return $( b.get "iprj.config.help_message" )
    else
        if [[ $# -lt 1 ]]; then
            ls $(b.get bang.working_dir)/tasks/__update__| xargs -l1 |sed -e 's/^update_//' -e 's/\.sh$//'
        else
            b.task.run "update_$@"

        fi
    fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
