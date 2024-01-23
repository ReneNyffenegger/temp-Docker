
msg() { echo -e "\n\e[94m$*\e[0m" ;}

NAME=entrypoint-shell-test

# docker rm $NAME-container > /dev/null

msg docker build
docker build -q -t $NAME-image .

msg docker create
docker create --name $NAME-container  $NAME-image > /dev/null

msg Starting the container for the first time:
docker start -i      $NAME-container
sleep 1

msg Starting the container the second time:
docker start -i      $NAME-container
sleep 1

msg Starting the container the third time:
docker start -i      $NAME-container
sleep 1


msg docker history
docker history $NAME-image
