## ADDITIONAL REMARKS

- 3 zookeeper nodes will be used instead of just 1.
- A node in this task is represented as a docker container.
- We will be using the kafka and zookeeper images from [Confluent](https://docs.confluent.io/3.1.1/cp-docker-images/docs/tutorials/clustered-deployment.html)

## Setup

The following tools are needed for this task to be executed:

- Docker. Installation instructions can be found in the official Docker website.
- `docker-compose` command.

## High Level Idea

We need to set up our architecture and create the following 3 entities: a topic, a consumer and a producer.

## Step 0: Running Docker Compose

A node in this task represents a docker container.

We need to set up the kafka and zookeeper docker containers using the docker compose file.

In one terminal, run `docker-compose up` to set up
the architecture. Leave this terminal as it is and open a new terminal tab

Verify that all the containers are running via
`docker ps`

## Step 1: Creating a topic

We need to create a topic for the consumer to consume.

Run `./create_topic.sh` to create a topic named `bar`.

Expected output from terminal:

- `Created topic "bar".`

## Step 2: Verify topic creation

Verify that the `bar` topic has been created succesfully

Run `./verify_topic.sh` to verify the topic's existence.

## Step 3: Generating Data (Console Producer)

We will now act as the producer and generate the data for
the consumer to consume.

Run `./generate_data.sh` to generate a sequence of 42 integers.

Expected Output:

- `Produced 42 messages.`

## Step 4: Consuming Data (Console Consumer)

We can finally consume the data that we have generated by
acting as the consumer.

Run `./read_messages.sh` to read the data. Note that
there might be some waiting time involved before data is
retrieved.

## Step 5: Teardown

Run `docker-compose down` to tear down the kafka and
zookeeper architecture.