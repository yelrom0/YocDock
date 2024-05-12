#!/bin/bash

cd /
echo "Cloning the Poky repository..."
git clone git://git.yoctoproject.org/poky
cd /poky
echo "Checking out the $YOCTO_RELEASE branch and pulling changes..."
git checkout -t origin/$YOCTO_RELEASE -b $YOCTO_RELEASE
git pull
echo "Initializing the build environment..."
source oe-init-build-env