#!/bin/bash
set -x

DEV=${1}
if [ "$DEV" == "" ]; then
  echo "resizefs.sh: expecting device as the 1st arg"
  exit 1
fi

if ls ${DEV} >/dev/null 2>&1; then
  fdisk ${DEV} <<EOF
d
n
p
1
16065

a
w
EOF
  partprobe
fi

resize2fs ${DEV}1
