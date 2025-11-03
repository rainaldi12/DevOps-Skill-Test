#!/bin/sh
set -e

echo "process disconnect network before down container"
echo ""
echo "disconnect network app to container proxy"
docker network disconnect app-php_local-web yii2-proxy
echo "disconnect all network container to container prometheus"
docker network disconnect app-php_local-web prometheus
docker network disconnect database_local-db prometheus
docker network disconnect proxy_local-proxy prometheus
echo "disconnect network done"

echo "process down container"
echo ""
cd app-php
docker compose down
cd ..
cd database
docker compose down
cd ..
cd proxy
docker compose down
cd ..
cd monitoring
docker compose down
cd ..