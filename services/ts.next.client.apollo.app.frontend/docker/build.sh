#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='ts.next.client.apollo.app.frontend'

cd `dirname $0`
cd ../../../

docker compose rm -s ${DC_SERRVICE_NAME}
docker compose build ${DC_SERRVICE_NAME} --no-cache
