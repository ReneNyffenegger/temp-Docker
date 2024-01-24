docker build -t tq84/dockertest-1 .

docker run --name tq84-test --rm -it tq84/dockertest-1 /bin/sh
#
#   --> We find oureselves in WORKDIR (i. e. /workdir)
