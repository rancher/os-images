#!/bin/bash
set -e

cd $(dirname $0)

source ./scripts/version
export VERSION

./scripts/clean
./scripts/download
./scripts/build-images
