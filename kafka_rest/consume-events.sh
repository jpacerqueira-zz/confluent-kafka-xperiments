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

sleep 10

curl -X GET \
     -H "Accept: application/vnd.kafka.json.v2+json" \
     http://localhost:8082/consumers/cg1/instances/ci1/records 

echo "Verify that you see the following output returned from the REST Proxy:"

echo "[{"topic":"purchases","key":"jsmith","value":"alarm clock","partition":0,"offset":0},{"topic":"purchases","key":"htanaka","value":"batteries","partition":0,"offset":1},{"topic":"purchases","key":"awalther","value":"bookshelves","partition":0,"offset":2}] "

echo "done!"
