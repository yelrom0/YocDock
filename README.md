# YocDock

A simple docker-compose setup for Yocto development. Using [crops/toaster](https://github.com/crops/toaster-container) for development and [crops/poky](github.com/crops/poky-container) for building.

## Prerequisites

- [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/)

## Usage

1. Clone this repository
2. Update the SRC_DIR value in the .env file with desired source directory
3. Run `run.sh --dev` to start the dev container or `run.sh --build` to start the build container and run the build

Or you can run docker-compose directly using the run scripts as a guide.

## Rebuiding the image

TODO: add image rebuilding to build script