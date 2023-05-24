The scratch image is the most minimal image in Docker: it does not contain any folders or files.

This is the base ancestor for all other images.

While scratch appears in Docker’s repository on the hub, you can’t pull it, run
it, or tag any image with the name scratch. Instead, you can refer to it in
your Dockerfile. For example, to create a minimal container using scratch:
