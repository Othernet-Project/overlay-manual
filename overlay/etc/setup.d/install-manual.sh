#!/bin/sh

PFX=outernet-lband-manual-v
SOURCE=/usr/doc
TARGET=/mnt/downloads

findmans() {
  dir="$1"
  echo $(cd "$dir"; find -name "${PFX}*.pdf")
}

tgt_man="$(findmans "$TARGET")"
src_man="$(findmans "$SOURCE")"
latest="$(echo -e "$tgt_man\n$src_man" | sort -r | head -n1)"
if [ "$latest" == "$src_man" ]; then
  rm "$TARGET/${PFX}"*.pdf
  cp "$SOURCE/${PFX}"*.pdf "$TARGET"
fi
