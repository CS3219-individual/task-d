#!/bin/bash

docker run \
 --net=host \
 --rm \
 confluentinc/cp-kafka:3.1.1 \
 kafka-console-consumer --bootstrap-server localhost:29092 --topic bar --new-consumer --from-beginning --max-messages 42