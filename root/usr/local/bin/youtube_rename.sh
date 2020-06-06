#!/bin/bash

if [[ "${1##*.}" == "json" ]]; then
    jq -e '(.playlist != null)' $1 >/dev/null
    if [[ $? -eq 0 ]]; then
        dir=$(realpath $1 | xargs dirname)
        dirname=$(realpath $1 | xargs dirname | xargs basename)

        playlist=$(jq '(.playlist)' $1)
        for file in $(ls $dir); do
            mv $file "$playlist - $file"
        done
        
        mkdir "$dir/../$playlist - $dirname"
        cp -r $dir/* "$dir/../$playlist - $dirname"
        rm -rf $dir
    fi
fi

exit 0
