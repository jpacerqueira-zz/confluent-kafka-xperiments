#!/usr/bin/env bash
#
#java -classpath ~/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar:kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar:target/jmstokafka-0.0.1.jar com.fuelbigdata.publisher.ConsumerApp
#
if [ "$(uname)" == "MINGW64_NT-10.0-19042" ]; then
    mkdir -p clibjava
    cp -rf ~/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar clibjava/
    cp -rf kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar clibjava/
    cp -rf target/jmstokafka-0.0.1.jar clibjava/
    java -cp $(for i in clibjava/*.jar ; do echo -n $i\; ; done).  com.fuelbigdata.publisher.PublisherApp
    rm -rf clibjava
else
    java -classpath ~/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar:kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar:target/jmstokafka-0.0.1.jar com.fuelbigdata.publisher.ConsumerApp
fi
#
