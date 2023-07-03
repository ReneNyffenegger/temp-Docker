FROM         busybox
ARG          BUILDTYPE
COPY         script.sh /script.sh
RUN          chmod +x  /script.sh
#CMD        ["/script.sh", ${BUILDTYPE}]
#CMD         ["bash",  "/script.sh"]
RUN /script.sh xxx
