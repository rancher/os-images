#!/bin/bash
set -ex

RESIZE_DEV=${RESIZE_DEV:?"RESIZE_DEV not set."}
STAMP=/var/log/resizefs.done

if [ -e "${STAMP}" ]; then
    echo FS already resized.
    exit 0
fi

if [ -b "${RESIZE_DEV}" ]; then
  START=$(fdisk ${RESIZE_DEV} <<EOF | grep -e "^${RESIZE_DEV}1" | awk '{print $2}'
p
q
EOF
  )
  (fdisk ${RESIZE_DEV} <<EOF
d
n
p
1
${START}

a
w
EOF
  ) && fdisk_exit=0 || fdisk_exit=$?
  [ "$fdisk_exit" -eq 0 ] || [[ "$FORCE" ]]
  
  partprobe
  resize2fs ${RESIZE_DEV}1 || :
else
  echo "Block device expected: ${RESIZE_DEV} is not."
  exit 1
fi

touch $STAMP
