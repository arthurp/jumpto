# From: http://stackoverflow.com/questions/11655770/bash-scripting-looping-through-a-environmental-variable-path-list#29949759
IFS=: read -r -d '' -a path_array < <(printf '%s:\0' "$JUMP_PATH")

# From: http://stackoverflow.com/questions/3685970/check-if-an-array-contains-a-value#8574392
function elementNotIn() {
    local e
    for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 1; done
    return 0
}


possibilities=()

function checkAndAddPossibility() {
    t="$1"
    t="$(readlink "$t")"
    if [ "$#" -eq 2 ]; then
        v="$2"
    else
        v="$t"
    fi
    if [ -d "$t" ] && elementNotIn "$v" "${possibilities[@]}" ; then
        possibilities+=("$v/")
        return 0
    fi
    return 1
}
