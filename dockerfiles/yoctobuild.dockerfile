FROM yocdock-base:latest

# Set Workdir
WORKDIR /workdir

# TODO: add script to run build in workdir dependencies

# Set Entrypoint
CMD ["/bin/bash"]