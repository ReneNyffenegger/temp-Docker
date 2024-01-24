
docker build -q -t  env-test .
docker inspect -f '{{.Config.Entrypoint}}' env-test
docker inspect -f '{{.Config           }}' env-test
docker inspect -f '{{.Config.Cmd       }}' env-test

docker run --rm -it env-test '-c echo foo'
