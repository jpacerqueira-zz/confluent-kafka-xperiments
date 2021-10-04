

 1. Example test


   joaocerqueira@Joaos-MacBook-Pro jms-publisher % cat test-jms-to-kakfa.sh 
   #!/usr/bin/env bash
   #
   java -classpath ~/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar:kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar:target/jmstokafka-0.0.1.jar com.fuelbigdata.publisher.PublisherApp
   #
   joaocerqueira@Joaos-MacBook-Pro jms-publisher % bash -x test-jms-to-kakfa.sh 
   + java -classpath /Users/joaocerqueira/.m2/repository/javax/jms/jms/1.1/jms-1.1.jar:kafka-jms-fatjar/target/kafka-jms-client-fat-4.1.2.jar:target/jmstokafka-0.0.1.jar com.fuelbigdata.publisher.PublisherApp
   SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
   SLF4J: Defaulting to no-operation (NOP) logger implementation
   SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
   New fpML Trade Message n=0
   New fpML Trade Message n=1
   New fpML Trade Message n=2
   New fpML Trade Message n=3
   New fpML Trade Message n=4
   New fpML Trade Message n=5
   New fpML Trade Message n=6
   New fpML Trade Message n=7
   New fpML Trade Message n=8
   New fpML Trade Message n=9
   New fpML Trade Message n=10
   New fpML Trade Message n=11
   New fpML Trade Message n=12
   New fpML Trade Message n=13
   New fpML Trade Message n=14
   New fpML Trade Message n=15
   New fpML Trade Message n=16
   New fpML Trade Message n=17
   New fpML Trade Message n=18
   New fpML Trade Message n=19
   New fpML Trade Message n=20
   New fpML Trade Message n=21
   New fpML Trade Message n=22
   New fpML Trade Message n=23
   New fpML Trade Message n=24
   New fpML Trade Message n=25
   New fpML Trade Message n=26
   New fpML Trade Message n=27
   New fpML Trade Message n=28
   New fpML Trade Message n=29
   New fpML Trade Message n=30
   New fpML Trade Message n=31
   New fpML Trade Message n=32
   New fpML Trade Message n=33
   New fpML Trade Message n=34
   New fpML Trade Message n=35
   New fpML Trade Message n=36
   New fpML Trade Message n=37
   New fpML Trade Message n=38
   New fpML Trade Message n=39
   New fpML Trade Message n=40
   New fpML Trade Message n=41
   New fpML Trade Message n=42
   New fpML Trade Message n=43
   New fpML Trade Message n=44
   New fpML Trade Message n=45
   New fpML Trade Message n=46
   New fpML Trade Message n=47
   New fpML Trade Message n=48
   New fpML Trade Message n=49
   ^C%                                                                                                                                                                                                                                                                   joaocerqueira@Joaos-MacBook-Pro jms-publisher % pwd
   /Users/joaocerqueira/Documents/github/confluentinc/jms-publisher
   joaocerqueira@Joaos-MacBook-Pro jms-publisher %

