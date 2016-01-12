#!/bin/bash
set -e

cd $(dirname $0)

export ARTIFACTS=$(pwd)/assets
./../../../scripts/download

rm -rf ./build
mkdir -p ./build

echo Extracting ${ARTIFACTS}/os-base_amd64.tar.xz
tar xJf ${ARTIFACTS}/os-base_amd64.tar.xz -C ./build/
