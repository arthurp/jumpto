#! /bin/bash

DIR="$(readlink "$(dirname "$BASH_SOURCE")" || dirname "$BASH_SOURCE")"

. "$DIR/jumpto_lib.sh"


function _jp_compete() {
    target="$2"
    possibilities=()
    for p in "${path_array[@]}"; do
        for t in "$p/$target"*; do
            checkAndAddPossibility "$t" "${t#$p/}"
        done
        for t in "$p$target"*; do
            checkAndAddPossibility "$t" "${t#$p}"
        done
    done
    #echo "\n${possibilities[@]}\n"
    COMPREPLY=("${possibilities[@]}")
}

function jp {
    cd "$($DIR/jumpto.sh $@)"
}

complete -F _jp_compete -o plusdirs -o filenames -o nospace jp
