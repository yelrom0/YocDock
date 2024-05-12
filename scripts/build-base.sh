#!/bin/bash

# Check if rebuild flag is set
if [[ "$1" == "--rebuild" ]]; then
    docker-compose build --no-deps yocdock-base || \
        { echo "Failed to rebuild the base image. Aborting..."; exit 1; }
fi

# Check if the base image exists
echo "Checking if the base image exists..."
if [[ "$(docker images -q yocdock-base 2> /dev/null)" == "" ]]; then
    echo "Base image not found. Building it..."
    docker-compose build yocdock-base || \
        { echo "Failed to build the base image. Aborting..."; exit 1; }
fi