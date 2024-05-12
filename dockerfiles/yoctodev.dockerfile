FROM yocdock-base:latest

# Set Workdir
WORKDIR /poky

COPY ./scripts/install-toaster.sh /
RUN bash /install-toaster.sh
USER root
RUN rm /install-toaster.sh
USER yoctouser

COPY ./scripts/run-toaster.sh /

# Set Entrypoint
ENTRYPOINT ["/run-toaster.sh"]