#!/bin/bash

BASE=$(dirname $0)

rm -rf ${BASE}/build
mkdir -p ${BASE}/build
cp src/docker/01-base/entry.sh ${BASE}/build/
cp src/docker/02-console/console.sh ${BASE}/build/
cp src/docker/02-console/update-ssh-keys ${BASE}/build/
cp src/docker/02-console/rancheros-install ${BASE}/build/
