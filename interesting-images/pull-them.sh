# docker pull scratch reserved image
docker pull alpine                         # busybox builds on alpine
docker pull busybox                        # alpine builds on busybox

#
# distroless containers are very small:                   (  a “distroless” image is one which contains only the application and its dependencies.  )
# The smallest distroless image,
#    gcr.io/distroless/static-debian11,
# is around 2 MiB.
# That's about 50% of the size of alpine (~5 MiB),
# and less than 2% of the size of debian (124 MiB).
#
# distroless images by default do not contain a shell -> That means the Dockerfile ENTRYPOINT command, when defined, must be specified in vector form, to avoid the container runtime prefixing with a shell.
#
#  Distroless images are based on Debian 11 (bullseye) and Debian 12 (bookworm). 
#
docker pull gcr.io/distroless/static-debian12

docker pull hello-world
docker pull python
