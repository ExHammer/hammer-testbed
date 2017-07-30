#! env bash

for i in {1..12}
do
    echo $(curl -s http://localhost:4000/timestamp)
    echo '    ' $(curl -s http://localhost:4000/timestamp/rl)
done
