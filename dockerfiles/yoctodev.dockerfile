FROM yocdock-base:latest

# Set Workdir
WORKDIR /workdir

COPY ../scripts/install-toaster.sh /
RUN bash /install-toaster.sh && \
    rm /install-toaster.sh

# Set Entrypoint
CMD ["source", "toaster", "start"]