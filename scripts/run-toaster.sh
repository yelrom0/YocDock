#!/bin/bash

#mkdir -p /workdir/pocky
cd /poky
echo $(ls /)
source oe-init-build-env /poky
source toaster start webport=0.0.0.0:8000

while true; do
    sleep 1
done