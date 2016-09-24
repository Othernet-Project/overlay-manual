#!/bin/sh

# both paths _must_ be absolute!
SOURCE=/usr/doc
DEST=/mnt/downloads

# files in $SOURCE should have version numbers in their name
# _exactly like so: vnn.nn - eg. v04.32

cd "$SOURCE"
for i in *
do
        cd "$DEST"
        target="${i/ v??.??./ v??.??.}"
        target_globbed="$(eval echo ${target// /\\ })"
        if [ -f "$target_globbed" ]
        then
                if [ "${target_globbed}" "<" "${i}" ]
                then
                        rm "${target_globbed}"
                        cp "$SOURCE/${i}" .
                fi
        else
                cp "$SOURCE/${i}" .
        fi
done

