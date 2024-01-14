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
mv kafka_2.13-3.1.0 kafka
cd kafka
```

## Start-up

One ssh connection needed for each of the below.  
Exit in reverse order with Ctrl-C.

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

## Clean up

```sh
rm -rf /tmp/kafka-logs /tmp/zookeeper
```

## Services

For zookeeper:

```sh
vi /etc/systemd/system/zookeeper.service
```

File contents:

```yaml
[Unit]
Requires=network.target remote-fs.target
After=network.target remote-fs.target

[Service]
Type=simple
User=root
ExecStart=/root/kafka/bin/zookeeper-server-start.sh /root/kafka/config/zookeeper.properties
ExecStop=/root/kafka/bin/zookeeper-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target
```

For server:

```sh
vi /etc/systemd/system/kafka.service
```

File contents:

```yaml
[Unit]
Requires=zookeeper.service
After=zookeeper.service

[Service]
Type=simple
User=root
ExecStart=/bin/sh -c '/root/kafka/bin/kafka-server-start.sh /root/kafka/config/server.properties > /root/kafka/kafka.log 2>&1'
ExecStop=/root/kafka/bin/kafka-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target
```

### Start service

```sh
systemctl start kafka
# verify with
journalctl -u kafka
service kafka status
```

### Enable service on reboot

```sh
systemctl enable kafka
```

## Resources

```html
https://kafka.apache.org/quickstart
https://www.digitalocean.com/community/tutorials/how-to-install-apache-kafka-on-debian-10
```
