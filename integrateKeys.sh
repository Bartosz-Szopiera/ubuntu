# It gets the keybindings data and copies in right form to the right place
# or uses API to set it up

pseudoXML="$(cat $1)"

# printf "input:\n$pseudoXML"
if [ -z "$pseudoXML" ]; then
    echo 'no input'
fi

getSchema () {
    string="$1"
    regex="<keys>.*?</keys>"
    echo "$string" | grep -m1 -oP "$regex"
}

echo $(getSchema "$pseudoXML")

# getSchema $pseudoXML > matched.xml
# cat matched.xml
