#!/bin/bash
set -e

cd $(dirname $0)

./scripts/clean
./scripts/download
./scripts/build-images
