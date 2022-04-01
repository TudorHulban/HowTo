# Kafka Message Broker installation on Debian 11
Proxmox container installation.  
Disk: 8 Gb.  
Memory: 8 Gb.
## Prerequisites
Java installation:
```sh
apt install default-jre
```
Kafka download:
```sh
wget https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz
tar -xzf kafka_2.13-3.1.0.tgz
cd kafka_2.13-3.1.0
```
## Start-up
One ssh connection needed for each of the below.
### Zookeper
```sh
bin/zookeeper-server-start.sh config/zookeeper.properties
```
### Server
```sh
bin/kafka-server-start.sh config/server.properties
```
### Create Topic
```sh
bin/kafka-topics.sh --create --topic quickstart-events --bootstrap-server localhost:9092
```
Check topic:
```sh
bin/kafka-topics.sh --describe --topic quickstart-events --bootstrap-server localhost:9092
```
### Write Events
```sh
bin/kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092
```
### Read Events
```sh
bin/kafka-console-consumer.sh --topic quickstart-events --from-beginning --bootstrap-server localhost:9092
```


