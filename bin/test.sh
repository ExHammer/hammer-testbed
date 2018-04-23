#! /usr/bin/bash

for i in {1..10}
do
    echo $(curl -s http://localhost:4000/timestamp)
    echo '   ' $(curl -s http://localhost:4000/timestamp/rl)
done
