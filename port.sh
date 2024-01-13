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
  docker run --name port-published-test --rm -i -t -p 8001:7001 python:alpine  /bin/sh -c 'cd /etc; python -m http.server 8001 --bind 0.0.0.0'          # 


# This works, too 
  docker run --name port-published-test --rm -i -t -p 8001:8001 python:alpine  /bin/sh -c 'cd /etc; python -m http.server 8001 --bind 0.0.0.0'          # -->  Use curl   http://127.0.0.1:8001/netconfig

  docker run --name port-published-test --rm -i -t -p 7001:8001 python:alpine  /bin/sh -c 'cd /etc; python -m http.server 8001 --bind 0.0.0.0'          # --> curl http://127.0.0.1:7001/netconfig  (Access port 8001 on port 7001)



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

# communicate with each other

  docker run --name communication-test-server --rm -i -t --ip 172.18.0.42  -p 8001:8001 python:alpine  /bin/sh -c 'cd /etc; python -m http.server 8001 --bind 0.0.0.0'

  IPSERVER=$( docker inspect communication-test-server | jq ".[0].NetworkSettings.Networks.\"client-server-network\".IPAddress" )

  docker run --name communication-test-client --rm -i -t              python:alpine  /bin/sh -c 'wget http://localhost:8001'

# ---------------------------------------------------------

  docker network create -d bridge client-server-network

  docker run --name communication-test-server --rm -i -t --network client-server-network python:alpine  /bin/sh -c 'python -m http.server 8001 -d /etc --bind 0.0.0.0'

   Debian ~ curl http://localhost:8001/
   curl: (7) Failed to connect to localhost port 8001: Connection refused

  docker run --name communication-test-client --rm -i -t --network client-server-network python:alpine  /bin/sh -c 'wget http://localhost:8001'

# --------------------------
  #  access port on host

  # On host
    
  python3 -m http.server 8001 --bind 0.0.0.0

  docker run                 --rm -i -t                python:alpine /bin/sh -c 'wget http://localhost:8001/'

  docker run  --network host --rm -i -t                python:alpine /bin/sh -c 'wget http://localhost:8001/'

  docker run  --network host --rm -i -t --hostname xyz python:alpine /bin/sh -c 'wget http://localhost:8001/'

# --------------------------
  # Hostname


  docker run --name hostname-test --network host --rm -i -t --hostname xyz python:alpine /bin/sh
