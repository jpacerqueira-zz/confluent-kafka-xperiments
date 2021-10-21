# echo "docker create topic "
# docker compose exec broker  kafka-topics --create  --topic purchases --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1

echo "dicker rest-proxy"
source getting-started.properties
docker-compose -f rest-proxy.yml up -d

echo "wait 20 seconds for logs"
sleep 20
docker-compose -f rest-proxy.yml logs rest-proxy | grep "Server started, listening for requests"


