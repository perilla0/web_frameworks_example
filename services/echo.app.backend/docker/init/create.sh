#!/bin/bash

cd `dirname $0`
source ../../.service_env

cd ../../../../

source .env

mkdir -p ./services/${DC_SERRVICE_NAME}/src

# プロジェクトの作成は現在のユーザーで行う
# https://echo.labstack.com/docs/quick-start
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
go mod init app
go get github.com/labstack/echo/v4
"

cp ./services/${DC_SERRVICE_NAME}/docker/init/copy/server.go ./services/${DC_SERRVICE_NAME}/src/server.go
