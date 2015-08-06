#!/bin/bash
set -e

cd $(dirname $0)
rm -rf ./build
mkdir -p ./build/initrd

tar xf ./../00-rootfs/build/dist/rootfs-static.tar -C ./build/initrd --strip-components=2 ./bin/busybox
tar xf ./../00-rootfs/build/dist/rootfs-static.tar -C ./build/initrd --strip-components=3 ./usr/sbin/xtables-multi
