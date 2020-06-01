#!/bin/bash

if [[ $(jq [.playlist]) -ne "NA" ]]; then
    playlist=$(jq [.playlist])
    for file in $(ls ./); do
        mv $file "$playlist - $file"
    done
    dir=$(dirname $1)
    mv $dir "$playlist - $dir"
fi

exit 0