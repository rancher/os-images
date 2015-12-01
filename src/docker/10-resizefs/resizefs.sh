#!/bin/bash
set -x

DEV=${1}
STAMP=/var/log/resizefs.done

if [ "$DEV" == "" ]; then
  echo "resizefs.sh: expecting device as the 1st arg"
  exit 1
fi

if [ -e $STAMP ]; then
    echo FS already expanded.
    exit 0
fi

if ls ${DEV} >/dev/null 2>&1; then
  START=$(fdisk ${DEV} <<EOF | grep -e "^${DEV}1" | awk '{print $2}'
p
q
EOF
  )
  fdisk ${DEV} <<EOF
d
n
p
1
${START}

a
w
EOF
  partprobe
fi

resize2fs ${DEV}1
touch $STAMP
