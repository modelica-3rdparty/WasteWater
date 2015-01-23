#!/bin/sh

for f in "$@"; do
  if ! echo "$f" | grep -q "dymola_[^.]*[.]mos"; then
    echo "Path $f does not match regex dymola_[^.]*[.]mos"
    exit 1
  fi
  sed -e 's/ := /=/' -e 's/;//' -e '/^$/d' -e 's/experiment Tolerance/tolerance/' "$f" > "`echo $f | sed s/dymola/omc/ | sed s/mos/override.txt/`"
done
