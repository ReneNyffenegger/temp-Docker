if [ $# -eq 0 ]; then
    echo provide image name
    exit 1
fi

docker run --name $1-test --rm -i -t  $1  /bin/sh
