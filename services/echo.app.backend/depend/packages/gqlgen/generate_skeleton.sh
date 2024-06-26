#!/bin/bash

cd `dirname $0`
source ../../../.service_env

cd ../../../../../

# https://gqlgen.com/getting-started/
# スケルトンを作成
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "

rm -rf /depend/packages/gqlgen/skeleton

mkdir -p /depend/packages/gqlgen/skeleton

cd /depend/packages/gqlgen

cp -f /app/src/go.mod ./skeleton
cp -f /app/src/go.sum ./skeleton

cd skeleton
go run github.com/99designs/gqlgen init

"
