# tasks/arduino.sh
function btask.update_arduino.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_arduino"

        return $( b.get "iprj.config.help_message" )
    fi

    echo :arduino:
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
