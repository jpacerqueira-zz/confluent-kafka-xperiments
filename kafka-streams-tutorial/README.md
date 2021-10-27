

   1.)  Follow as example from -- https://kafka.apache.org/30/documentation/streams/tutorial

   1.1.  run with maven and JAVA8
     jc@J-Pro kafka-streams-tutorial % ./maven-archetype-setup.sh
     
     
   2.) Follow tutorial and build local KafkaStream App
   
   jc@J-Pro kafka-streams-tutorial % cd streams.examples/
      
   % mvn clean package

   % mvn exec:java -Dexec.mainClass=com.fuelbigdata.kafkaStreamApps.PipeKstream

  --- exec-maven-plugin:3.0.0:java (default-cli) @ streams.examples ---
       SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
       SLF4J: Defaulting to no-operation (NOP) logger implementation
       SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
       Topologies:
          Sub-topology: 0
            Source: KSTREAM-SOURCE-0000000000 (topics: [streams-plaintext-input])
                     --> KSTREAM-SINK-0000000001
            Sink: KSTREAM-SINK-0000000001 (topic: streams-pipe-output)
                     <-- KSTREAM-SOURCE-0000000000
