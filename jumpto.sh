#! /bin/bash

DIR="$(readlink -f "$(dirname "$BASH_SOURCE")")"

target=$1

# If this is already a directory don't search
if [ -d "$target" ]; then
    echo -n "$target"
    exit 0
fi

. "$DIR/jumpto_lib.sh"

for p in "${path_array[@]}"; do
    checkAndAddPossibility "$p/$target" || checkAndAddPossibility "$p$target"
done

to="${possibilities[0]}"
next=false

for p in "${possibilities[@]}"; do
    if $next; then
        to="$p"
        break
    fi
    if [ "$PWD" = "$p" ]; then
        next=true
    fi
done

echo -n "$to"
