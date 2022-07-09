# tasks/ls.sh
function btask.maven_ls.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_ls"

        return $( b.get "iprj.config.help_message" )
    fi

    ls $(b.get bang.working_dir)/tasks/__maven__| xargs -l1 |sed -e 's/^maven_//' -e 's/\.sh$//'
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
