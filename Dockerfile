FROM archlinux:multilib-devel

# Set Workdir
WORKDIR /yocto

# Setup "build" user
RUN useradd --no-create-home \
    --shell=/bin/false build && \
    usermod -L build

# Install Yay Package Manager
RUN pacman -Syu --noconfirm git && \
    git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si --noconfirm && \
    cd .. && \
    rm -rf yay && \
    yay --save --answerclean None \
    --answerdiff None --answeredit \
    None --answerupgrade None

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