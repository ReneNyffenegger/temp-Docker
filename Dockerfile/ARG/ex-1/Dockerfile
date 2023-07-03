FROM         busybox
ARG          BUILDTYPE
COPY         script.sh /script.sh
ENTRYPOINT ["sh", "./script.sh", ${BUILDTYPE}]
