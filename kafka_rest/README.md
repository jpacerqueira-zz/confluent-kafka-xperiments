

   1.) Run producer of events

     jc@J-Pro kafka_rest % cat produce-events.sh
          curl -X POST \
               -H "Content-Type: application/vnd.kafka.json.v2+json" \
               -H "Accept: application/vnd.kafka.v2+json" \
               --data '{"records":[{"key":"jsmith","value":"alarm clock"},{"key":"htanaka","value":"batteries"},{"key":"awalther","value":"bookshelves"}]}' \
               "http://localhost:8082/topics/purchases"


   2.) Run Consumer of events

     jc@J-Pro kafka_rest % cat consume-events.sh 
          echo "Create a consumer, starting at the beginning of the topic's log:"
          curl -X POST \
               -H "Content-Type: application/vnd.kafka.v2+json" \
               --data '{"name": "ci1", "format": "json", "auto.offset.reset": "earliest"}' \
               http://localhost:8082/consumers/cg1

          echo "Subscribe to the topic purchases:"
          curl -X POST \
               -H "Content-Type: application/vnd.kafka.v2+json" \
               --data '{"topics":["purchases"]}' \
               http://localhost:8082/consumers/cg1/instances/ci1/subscription 

          echo "Consume some data using the base URL in the first response: (Note that you must issue this command twice due to https://github.com/confluentinc/kafka-rest/issues/432)"
          curl -X GET \
               -H "Accept: application/vnd.kafka.json.v2+json" \
               http://localhost:8082/consumers/cg1/instances/ci1/records 

