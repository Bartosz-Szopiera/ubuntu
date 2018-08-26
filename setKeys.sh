# To pass file as argument write:
# sh setKeys.sh /path/toFile.txt

keybindings=$1

while read row; do
    schema=$(echo $row | grep -oP "^[a-zA-Z.]+")
    command="$(echo $row | grep -oP " [a-zA-Z0-9-]+ ")"
    keys=$(echo $row | grep -oP "\[.*\]$")
    echo "Setting command:" $command "under:" $keys
    $(gsettings set $schema $command "$keys")
done < $keybindings
