#!/bin/bash
cd `dirname $0`
cd ../../

docker compose down --rmi all
docker compose build --no-cache
