#!/bin/bash
set -e

cd $(dirname $0)

export ARTIFACTS=$(pwd)/assets
./../../../scripts/download

rm -rf ./build
mkdir -p ./build

echo Extracting ${ARTIFACTS}/os-base.tar.xz
tar xJf ${ARTIFACTS}/os-base.tar.xz -C ./build/

tar xvf ./build/dist/kernel/*.tar -C ./build/dist/kernel                                #prep: unpack kernel
