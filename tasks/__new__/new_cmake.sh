# tasks/cmake.sh
function btask.new_cmake.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_cmake"

        return $( b.get "iprj.config.help_message" )
    else
        echo :cmake:

        echo Arg: "$1"
    fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
