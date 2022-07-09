# tasks/gradle.sh
function btask.new_gradle.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_gradle"

        return $( b.get "iprj.config.help_message" )
    else
        echo :gradle:

    cd $LOCALPATH

    cat <<EOF | dmenu -i -l 52 -fn 'Droid Sans Mono-31' -nf yellow -nb black -sf black -sb white | sh
gradle init --type java-library
gradle init --type java-application
gradle init --type java-application --test-framework spock
gradle init --type java-library --test-framework testng
gradle init --type groovy-application
EOF

    fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
