# Load keybindings from selected system directories or APIs

userSchemas=$@ #get all user arguments

defaultSchemas=('org.gnome.desktop.wm.keybindings')

#!Try to put line-break after each tag

getUserSchemas () {
    if [ -z $userSchemas ]; then
        echo $defaultSchemas
    else
        echo $userShemas
    fi
}

getActions () {
    schema=$1
    echo $(gsettings list-keys $schema) #Handle errors here
}

getKeys () {
    schema=$1
    action=$2
    echo $(gsettings get $schema $action)
}

getData () {
    schemas=$(getUserSchemas)
    output=""

    for schema in $schemas; do
        actions=$(getActions $schema)
        actionKeyPairs=()
        output="$output<schema>$schema<actions>"

        for action in $actions; do
            keybindings=$(getKeys $schema $action)
            output="$output<cmd>$action<keys>$keybindings</keys></cmd>"
        done
        
        output="$output</actions></schema>"
    done

    echo "$output"
}

getData > extractedKeys.xml

# echo $(getData)