#!/bin/bash

if [[ "$1" == "--dev" ]] || [[ "$1" == "-d"]]; then
    docker-compose up -d yocdock-dev
elif [[ "$1" == "--build" ]] || [[ "$1" == "-b" ]]; then
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