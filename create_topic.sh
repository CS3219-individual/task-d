#!/bin/bash

docker run \
  --net=host \
  --rm \
  confluentinc/cp-kafka:3.1.1 \
  kafka-topics --create --topic bar --partitions 3 --replication-factor 3 --if-not-exists --zookeeper localhost:32181