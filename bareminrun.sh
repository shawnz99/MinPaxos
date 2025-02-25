#!/bin/bash

echo "installing most recent saved versions"
rm -rf bin/*

#go install master
#go install server
#go install client
#go install clientretry
#go install genericsmr
#go install bareminpaxos
#go install minpaxosproto

go build -o ./bin/master ./src/master
go build -o ./bin/server ./src/server
go build -o ./bin/client ./src/client
go build -o ./bin/clientretry ./src/clientretry
#go build -o ./bin/genericsmr ./src/genericsmr
#go build -o ./bin/bareminpaxos ./src/bareminpaxos
#go build -o ./bin/minpaxosproto ./src/minpaxosproto
go install ./src/genericsmr
go install ./src/bareminpaxos
go install ./src/minpaxosproto



echo "finished installing most recent saved versions"

bin/master &
bin/server -port 7070 -min -durable &
sleep 2
bin/server -port 7071 -min -durable &
sleep 2
bin/server -port 7072 -min -durable &
