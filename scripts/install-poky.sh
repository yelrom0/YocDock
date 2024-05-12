#!/bin/bash

cd /
git clone --depth 1 -b $YOCTO_RELEASE git://git.yoctoproject.org/poky
cd /poky
source oe-init-build-env