#!/bin/bash

git config --global --add safe.directory /poky
git checkout -t origin/$YOCTO_RELEASE -b $YOCTO_RELEASE
git pull
cp -r /poky /workdir/poky

cd /workdir/poky
source oe-init-build-env
source toaster start webport=0.0.0.0:8000

while true; do
    sleep 1
done