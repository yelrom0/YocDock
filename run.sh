#!/bin/bash

if [[ "$1" == "--dev" ]] || [[ "$1" == "-d"]]; then
    source ./scripts/build-base.sh || exit 1
    echo "Running the development environment..."
    docker-compose up -d yocdock-dev || \
        { echo "Failed to run the development environment. Aborting..."; exit 1; }
elif [[ "$1" == "--build" ]] || [[ "$1" == "-b" ]]; then
    source ./scripts/build-base.sh || exit 1
    echo "Building the image(s)..."
    echo "Sorry, this feature is not implemented yet."
    # docker-compose run --rm yocdock-build
elif [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
    echo "Usage: ./run.sh [OPTION]"
    echo "Options:"
    echo "  --dev, -d    Run the development environment"
    echo "  --build, -b  Build the images"
    echo "  --help, -h   Display this help message"
else
    echo "Invalid option. Use --help to see the available options"
fi