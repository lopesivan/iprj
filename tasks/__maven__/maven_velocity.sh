# tasks/velocity.sh
function btask.maven_velocity.run() {
    if [ "$1" == '--help' ]; then
        echo 1>&2 USAGE:
        echo 1>&2 iprj  maven velocity
        exit 1
    fi

    echo :velocity:
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
