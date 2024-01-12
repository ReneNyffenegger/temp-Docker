#!/bin/sh

#
#  Publishing Ports.
#

docker pull python:alpine

# Open new container

  docker run --name python-alpine-test --rm -i -t python:alpine  /bin/sh

# in /bin/sh in container, do:


  cd etc

  python -m http.server 8001

  # Now: try to connect to localhost:8001 from host -> does not work
  
  # In another session in 

  docker exec -it python-alpine-test  /bin/sh

  # wget localhost:8001

  # exit both sessions

  # Now: Open p
 
#  ------------------------------------------------

#  Now, start container with a  published port

  docker run --name port-published-test --rm -i -t -p 8001:7001 python:alpine  /bin/sh -c 'cd /etc; python -m http.server 8001'

   # localhost: 7001 is visible on 7001

$ docker port port-published-test
7001/tcp -> 0.0.0.0:8001

   # on another session:


  docker exec -it port-published-test  /bin/sh

# other tests
  docker run --name port-published-test --rm -i -t -p 8001:8001 python:alpine  /bin/sh -c 'cd /etc; python -m http.server 8001 --bind 127.0.0.1'
  docker run --name port-published-test --rm -i -t -p 8001:7001 python:alpine  /bin/sh -c 'cd /etc; python -m http.server 8001 --bind 0.0.0.0' 

# This works, too 
  docker run --name port-published-test --rm -i -t -p 8001:8001 python:alpine  /bin/sh -c 'cd /etc; python -m http.server 8001 --bind 0.0.0.0'          # -->  Use curl   http://127.0.0.1:8001/netconfig



# ----------------------------------------

  # This works!

 # Start 
   docker run --name network-test --rm -i -t --network host python:alpine  /bin/sh -c 'cd /etc; python -m http.server 8001'

  # In other shell on HOST
    curl   http://localhost:8001/netconfig


# ------------------------------


# TODO

# in container
  netstat -tulpn


# ---------------------------------------------------------
# curl: (56) Recv failure: Connection reset by peer

  # --> Port is open, but no application is listening:

  docker  run --name port-published-no-listener-test --rm  -i -t -p 1234:1234 python:alpine  /bin/sh

    # In host:

$ curl   http://127.0.0.1:8008/
curl: (7) Failed to connect to 127.0.0.1 port 8008: Connection refused

$ curl   http://127.0.0.1:1234/
curl: (56) Recv failure: Connection reset by peer

# ---------------------------------------------------------
