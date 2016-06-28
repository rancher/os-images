#!/bin/bash
set -e

DIR=$(readlink /lib/modules/$(uname -r)/build)
STAMP=${DIR}/.done
VER=$(basename $DIR)
KERNEL_HEADERS_URL=${KERNEL_HEADERS_URL:-https://github.com/rancher/os-kernel/releases/download/${VER}/build.tar.gz}

if [ -e $STAMP ]; then
    echo Headers already installed in $DIR
    exit 0
fi

echo Downloading $KERNEL_HEADERS_URL
mkdir -p $DIR
wget -O - $KERNEL_HEADERS_URL | gzip -dc | tar xf - -C $DIR
touch $STAMP

echo Headers installed at $DIR
