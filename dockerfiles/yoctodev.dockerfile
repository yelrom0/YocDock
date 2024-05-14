FROM yocdock-base:latest

# Set Workdir
WORKDIR /poky

USER root
RUN chown -R yoctouser:yoctouser /poky
USER yoctouser

COPY ./scripts/install-toaster.sh /
RUN bash /install-toaster.sh
USER root
RUN rm /install-toaster.sh
USER yoctouser

COPY ./scripts/run-toaster.sh /

# Set Entrypoint to tini and run start script
ENTRYPOINT ["tini", "--"]
CMD ["/run-toaster.sh"]