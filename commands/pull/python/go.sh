docker pull python:alpine

docker images -f reference=python
docker images -f reference=alpine  # << does not show anything

docker run  python:alpine /usr/bin/sh

# -------------

docker ps 
docker run  python:alpine
docker ps
docker ps -a

docker run --name python-test-one python:alpine 

docker exec python:alpine /usr/bin/sh
#
# Error: No such container: python:alpine

docker exec python-test-one /usr/bin/sh
# ==> Error response from daemon: Container f722254aa44e6feb85367909e0615a854af4fe20950bbd69e9a286a3b36755c9 is not running

$ docker start python-test-one
python-test-one
$ docker exec python-test-one /usr/bin/sh
# ==> Error response from daemon: Container f722254aa44e6feb85367909e0615a854af4fe20950bbd69e9a286a3b36755c9 is not running


$ docker run --name python-alpine-test --rm -i -t python:alpine  /bin/sh

# in another shell:

$ docker exec python-alpine-test  ps -A

# ----------------------------------

