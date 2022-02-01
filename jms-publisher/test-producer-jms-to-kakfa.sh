#!/usr/bin/env bash
#
#java -classpath ~/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar:kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar:target/jmstokafka-0.0.1.jar com.fuelbigdata.publisher.ProducerApp
#
if [ "$(uname)" == "MINGW64_NT-10.0-19044" ]; then
    mkdir -p plibjava
    cp -rf  ~/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar plibjava/
    cp -rf kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar plibjava/
    cp -rf target/jmstokafka-0.0.1.jar plibjava/
    java -cp $(for i in plibjava/*.jar ; do echo -n $i\; ; done).  com.fuelbigdata.publisher.ProducerApp
    rm -rf plibjava
else
    java -classpath ~/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar:kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar:target/jmstokafka-0.0.1.jar com.fuelbigdata.publisher.ProducerApp
fi
#
