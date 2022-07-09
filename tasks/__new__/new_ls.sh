# tasks/ls.sh
function btask.new_ls.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_ls"

        return $( b.get "iprj.config.help_message" )
    fi

    ls $(b.get bang.working_dir)/tasks/__new__| xargs -l1 |sed -e 's/^new_//' -e 's/\.sh$//'
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
