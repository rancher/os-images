#!/bin/bash

BASE=$(dirname $0)

rm -rf ${BASE}/build
mkdir -p ${BASE}/build
cp src/docker/00-base/entry.sh ${BASE}/build/
cp src/docker/01-console/console.sh ${BASE}/build/
cp src/docker/01-console/update-ssh-keys ${BASE}/build/
cp src/docker/01-console/rancheros-install ${BASE}/build/
