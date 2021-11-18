#!/usr/bin/env bash
#
# java -classpath ~/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar:kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar:target/jmstokafka-0.0.1.jar com.fuelbigdata.publisher.PublisherApp
mkdir -p libjava
cp -rf ~/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar libjava/
cp -rf kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar libjava/ 
cp -rf target/jmstokafka-0.0.1.jar libjava/
java -cp $(for i in libjava/*.jar ; do echo -n $i\; ; done).  com.fuelbigdata.publisher.PublisherApp
rm -rf libjava
#
