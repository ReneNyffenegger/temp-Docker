docker run your_image arg1 arg2 will replace the value of CMD with arg1 arg2
That's a full replacement of the CMD, not appending more values to it. This is why you often see docker run some_image /bin/bash to run a bash shell in the container.

    docker run my-image /bin/sh -c "echo foo"
