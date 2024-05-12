#!/bin/bash

mkdir -p /workdir/pocky
source oe-init-build-env /workdir/pocky
source toaster start webport=0.0.0.0:8000

while true; do
    sleep 1
done