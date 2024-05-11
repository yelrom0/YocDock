FROM archlinux:multilib-devel

# Set Workdir
WORKDIR /yocto

# Setup, lock and swap to "build" user
RUN useradd --no-create-home \
    --shell=/bin/sh build && \
    usermod -L build

# Install Yay Package Manager
RUN pacman -Syu --noconfirm git && \
    git clone https://aur.archlinux.org/yay.git && \
    chown -R build:build /yocto/yay && \
    cd yay && \
    su build -c "makepkg -si --noconfirm" && \
    cd .. && \
    rm -rf yay

# Install Dependencies
RUN yay -Syu --noconfirm \
    diffstat \
    unzip \
    texinfo \
    python \
    chrpath \
    wget \
    xterm \
    sdl \
    rpcsvc-proto \
    socat \
    cpio \
    inetutils \
    zsh \
    zsh-completions

# Install Toolchain
RUN git clone --branch master git://git.yoctoproject.org/poky.git ~/poky

# Set Environment Variables
ENV TEMPLATECONF=~/poky/meta-poky/conf \
    BUILDDIR=~/poky/build

# Set Entrypoint
ENTRYPOINT ["/bin/zsh", "-c"]