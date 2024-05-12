FROM archlinux:multilib-devel

# Set Workdir
WORKDIR /workdir

# TODO: add script to run build in workdir dependencies

# Set Entrypoint
CMD ["/bin/zsh"]