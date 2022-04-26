

    - Configure latest confluent Kafka Platform with docker-compose in local mode

   1. use script

     user@Users-MacBook-Pro kafka-cp_all % cat configure-start-confluent-cp-kafka-all-in-one.sh 

     #!/usr/bin/env bash

     curl --silent --output docker-compose.yml \

       https://raw.githubusercontent.com/confluentinc/cp-all-in-one/6.2.0-post/cp-all-in-one/docker-compose.yml

     docker-compose up -d

     docker-compose ps

     echo 'Navigate to the Control Center web interface at http://localhost:9021'

    2. To run in minimal mode start just zookeeper and broker container in the cluser

     # $ ls -l

    3. Use Clonfluenc.inc official KafkaCat in container mode to define the content of your topics

     # $ docker run --tty --network kafka-cp_all_default confluentinc/cp-kafkacat kafkacat -b broker:29092 -L

    4. Consume messages froma  topic named test-queue
    
     # $ docker run --tty --network kafka-cp_all_default confluentinc/cp-kafkacat kafkacat -b kafka:29092 -C -K: -f '\nKey (%K bytes): %k\t\nValue (%S bytes): %s\n\Partition: %p\tOffset: %o\n--\n' -t test-queue

     #
      
