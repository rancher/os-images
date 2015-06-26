#!/bin/bash
set -e

cd $(dirname $0)
rm -rf ./build
mkdir -p ./build/kernel

cp ./../00-rootfs/build/dist/kernel/boot/vmlinuz* ./build/kernel/vmlinuz
