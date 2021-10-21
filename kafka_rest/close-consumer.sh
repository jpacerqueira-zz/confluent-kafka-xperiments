echo "Close the consumer with a DELETE to make it leave the group and clean up its resources:"
curl -X DELETE \
     -H "Content-Type: application/vnd.kafka.v2+json" \
     http://localhost:8082/consumers/cg1/instances/ci1 

