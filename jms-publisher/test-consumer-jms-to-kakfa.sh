#!/usr/bin/env bash
#
#java -classpath ~/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar:kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar:target/jmstokafka-0.0.1.jar com.fuelbigdata.publisher.ConsumerApp
#
PATTERN_X="^(MINGW64_NT-10.0-19044$|MINGW64_NT-10.*-*)"
if [[ $(uname) =~ $PATTERN_X ]]; then
    mkdir -p clibjava
    cp -rf ~/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar clibjava/
    cp -rf kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar clibjava/
    cp -rf target/jmstokafka-0.0.1.jar clibjava/
    java -cp $(for i in clibjava/*.jar ; do echo -n $i\; ; done).  com.fuelbigdata.publisher.ConsumerApp
    rm -rf clibjava
else
    java -classpath ~/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar:kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar:target/jmstokafka-0.0.1.jar com.fuelbigdata.publisher.ConsumerApp
fi
#
