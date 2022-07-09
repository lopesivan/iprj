# tasks/latex.sh
function btask.update_latex.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_latex"

        return $( b.get "iprj.config.help_message" )
    fi

    echo :latex:
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
