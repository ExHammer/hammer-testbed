#! /usr/bin/bash

for i in {1..12}
do
    echo "$i =" $(curl -s http://localhost:4000/timestamp)
    echo '       ' $(curl -s http://localhost:4000/timestamp/rl)
done
