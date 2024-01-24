https://github.com/GoogleContainerTools/distroless

    Note that distroless images by default do not contain a shell. That means
    the Dockerfile ENTRYPOINT command, when defined, must be specified in
    vector form, to avoid the container runtime prefixing with a shell.

       OK:
          ENTRYPOINT ["myapp"]
       NOK:
          ENTRYPOINT "myapp"


https://learnk8s.io/blog/smaller-docker-images

     The scratch image doesn’t have a shell. This means that we cannot use the
     string syntax with CMD (or RUN, for that matter). Consider the following
     Dockerfile:

     When Docker detects the JSON syntax, it runs the arguments directly, without a shell.

ps -eo 'tty,pid,comm' | grep ^?
