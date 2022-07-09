# tasks/ignore.sh
function btask.maven_ignore.run() {
    if [ "$1" == '--help' ]; then
        b.get "iprj.config.help_message_ignore"

        return $( b.get "iprj.config.help_message" )
    fi


    local template_file="gitignore"
    local template_name=".$template_file"

    tput bold tput setb 3
    echo -n "-> "
    tput setaf 2
    echo "$template_name"
    tput sgr0

    cp "$(dirname $(readlink -f $(which iprj)))/model/ignore/$template_file" \
       "$LOCALPATH/$template_name"
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
