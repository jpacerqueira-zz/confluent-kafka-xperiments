#!/usr/bin/env bash
curl --silent --output docker-compose.yml \
  https://raw.githubusercontent.com/confluentinc/cp-all-in-one/6.2.0-post/cp-all-in-one/docker-compose.yml
docker-compose up -d
docker-compose ps
echo 'Navigate to the Control Center web interface at http://localhost:9021'
