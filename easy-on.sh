#!/bin/sh
set -e

# on all docker-compose
echo "process up all container"
echo ""
cd app-php
docker compose up -d
cd ..
cd database
docker compose up -d
cd ..
cd proxy
docker compose up -d
cd ..
cd monitoring
docker compose up -d
cd ..

# connect all network container to container prometheus
echo "process connect network after up container"
echo ""
echo "connect network app to container proxy"
docker network connect app-php_local-web yii2-proxy
echo "connect all network container to container prometheus"
docker network connect app-php_local-web prometheus
docker network connect database_local-db prometheus
docker network connect proxy_local-proxy prometheus
echo "connect network done"