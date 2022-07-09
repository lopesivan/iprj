# tasks/archetype.sh
function btask.maven_archetype.run() {
    if [ "$1" == '--help' ]; then
        echo 1>&2 USAGE:
        echo 1>&2 iprj  maven archetype
        exit 1
    fi

    if [ "$1" == '--list' ]; then
        package=br.eng.ivanlopes

        xmlfile=~/.m2/archetype-catalog.xml

        N=$( xmlstarlet sel -t -v  'count(//archetype)' <( sed -e '2,4d' -e '1a<archetype-catalog>' $xmlfile ) )

        cat <<EOF | sed 's/^ *//' |dmenu -i -l 52 -fn 'Droid Sans Mono-26' -nf green -nb black -sf black -sb white
        $( for i in `seq $N`; do

        p=/archetype-catalog/archetypes/archetype[$i]/artifactId
        a_artifact_id=$(
            xmlstarlet sel -t -v "$p" <( sed -e '2,4d' -e '1a<archetype-catalog>' $xmlfile )
        )

        echo $a_artifact_id
        done)
EOF
        exit 1
    fi
    cd $LOCALPATH

    read -p "Insert project Name: " project
    project=${project:-notEmpty}

    package=br.eng.ivanlopes

    xmlfile=~/.m2/archetype-catalog.xml

    N=$( xmlstarlet sel -t -v  'count(//archetype)' <( sed -e '2,4d' -e '1a<archetype-catalog>' $xmlfile ) )

    cat <<EOF | sed 's/^ *//' |dmenu -i -l 52 -fn 'Droid Sans Mono-16' -nf yellow -nb black -sf black -sb white | sh
    $( for i in `seq $N`; do
        p=/archetype-catalog/archetypes/archetype[$i]/groupId
        a_group_id=$(
            xmlstarlet sel -t -v "$p" <( sed -e '2,4d' -e '1a<archetype-catalog>' $xmlfile )
        )

        p=/archetype-catalog/archetypes/archetype[$i]/artifactId
        a_artifact_id=$(
            xmlstarlet sel -t -v "$p" <( sed -e '2,4d' -e '1a<archetype-catalog>' $xmlfile )
        )

        p=/archetype-catalog/archetypes/archetype[$i]/version
        a_version=$(
            xmlstarlet sel -t -v "$p" <( sed -e '2,4d' -e '1a<archetype-catalog>' $xmlfile )
        )

        echo mvn archetype:generate \
        -DarchetypeArtifactId=$a_artifact_id \
        -DartifactId=$project \
        -DgroupId=$package \
        -DarchetypeGroupId=$a_group_id \
        -DarchetypeVersion=$a_version \
        -DarchetypeCatalog=local \
        -DinteractiveMode=false
            done)
EOF
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
