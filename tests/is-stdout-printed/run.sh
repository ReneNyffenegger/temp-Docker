docker build -q -t tq84/stdout-test .

# docker run --rm tq84/stdout-test
  docker create --name stdout-test-cont tq84/stdout-test 
# docker run --rm --name stdout-test-cont tq84/stdout-test 

