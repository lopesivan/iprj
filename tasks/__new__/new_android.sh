# tasks/android.sh
function btask.new_android.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_android"

        return $( b.get "iprj.config.help_message" )
    fi

    echo :android:
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
