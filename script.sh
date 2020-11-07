docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)

# Run Zookeeper
docker run -d --name zookeeper -p 2181:2181 jplock/zookeeper

# Run Kafka
docker run -d \
--name kafka \
-p 7203:7203 \
-p 9092:9092 \
-e KAFKA_ADVERTISED_HOST_NAME=10.4.1.29 \
-e ZOOKEEPER_IP=10.4.1.29 \
ches/kafka

# Create topic
docker run \
--rm ches/kafka kafka-topics.sh \
--create \
--topic senz \
--replication-factor 1 \
--partitions 1 \
--zookeeper 10.4.1.29:2181

# List topic
docker run \
--rm ches/kafka kafka-topics.sh \
--list \
--zookeeper 10.4.1.29:2181

# Create publisher
docker run --rm --interactive \
ches/kafka kafka-console-producer.sh \
--topic senz \
--broker-list 10.4.1.29:9092

# Create consumer
docker run --rm \
ches/kafka kafka-console-consumer.sh \
--topic senz \
--from-beginning \
--zookeeper 10.4.1.29:2181

# Install kafkacat

