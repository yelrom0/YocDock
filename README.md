# YocDock

A simple docker-compose setup for Yocto development. Using [crops/toaster](https://github.com/crops/toaster-container) for development and [crops/poky](github.com/crops/poky-container) for building.

## Prerequisites

- [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/)

## Usage

1. Clone this repository
2. Run `git update-index --skip-worktree ./.env` to ignore changes to the .env file, then update the SRC_DIR value in the .env file with desired source directory.
3. If you want the image to build for both arm64 and amd, make sure you have [enabled containerd in Docker Desktop](https://docs.docker.com/desktop/containerd/#enable-the-containerd-image-store). Otherwise, remove whichever architecture you don't need from the [compose.yml](./compose.yml) file.
3. Run `run.sh --dev` to start the dev container or `run.sh --build` **(NOTE: build image is not yet ready)** to start the build container and run the build.

Or you can run docker-compose directly using the run scripts as a guide.

## Web Interface

The Toaster web interface (if compose not changed) is by default available at [http://localhost:18000](http://localhost:18000). 

Toaster's default tracked branches do not include the `scarthgap` branch, however selecting a branch in the we interface is not recommended as it could break on upstream branch changes. The container is setup to contain whichever branch selected in your [.env](./.env) file so it is recommended to change select the local branch version when creating a new project.

Additional information can be found in the [Toaster documentation](https://docs.yoctoproject.org/toaster-manual/setup-and-use.html#additional-information-about-the-local-yocto-project-release).

## Rebuiding the image

## TODO

- ~~[X] Add image rebuilding to build script~~
- [ ] Setup yocto build dockerfile
- [ ] Add aritecture selection to env
- [ ] Stop and remove relevant containers/images when rebuilding