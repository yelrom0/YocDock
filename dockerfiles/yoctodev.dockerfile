FROM yocdock-base:latest

# Set Workdir
WORKDIR /workdir

COPY ./scripts/install-toaster.sh /
RUN bash /install-toaster.sh
USER root
RUN rm /install-toaster.sh
USER yoctouser

# Set Entrypoint
CMD ["source", "toaster", "start"]