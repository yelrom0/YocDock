FROM archlinux:multilib-devel

# Set Workdir
WORKDIR /yocto

# Setup "build" user, give passwordless sudo,
# create home directory, and set permissions
RUN useradd -d /home/build build && \
    mkdir -p /home/build && \
    chown -R build:build /home/build && \
    echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install Yay Package Manager
RUN pacman -Syu --noconfirm git go && \
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