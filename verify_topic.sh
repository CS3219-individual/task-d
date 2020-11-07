#!/bin/bash

docker run \
    --net=host \
    --rm \
    confluentinc/cp-kafka:3.1.1 \
    kafka-topics --describe --topic bar --zookeeper localhost:32181