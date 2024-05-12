#!/bin/bash

# Check if the base image exists
echo "Checking if the base image exists..."
if [[ "$(docker images -q yocdock-base 2> /dev/null)" == "" ]]; then
    echo "Base image not found. Building it..."
    docker-compose build yocdock-base
fi

if [[ "$1" == "--dev" ]] || [[ "$1" == "-d"]]; then
    echo "Running the development environment..."
    docker-compose up -d yocdock-dev
elif [[ "$1" == "--build" ]] || [[ "$1" == "-b" ]]; then
    echo "Building the image(s)..."
    docker-compose run --rm yocdock-build
elif [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
    echo "Usage: ./run.sh [OPTION]"
    echo "Options:"
    echo "  --dev, -d    Run the development environment"
    echo "  --build, -b  Build the images"
    echo "  --help, -h   Display this help message"
else
    echo "Invalid option. Use --help to see the available options"
fi