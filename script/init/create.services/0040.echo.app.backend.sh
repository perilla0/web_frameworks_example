#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='echo.app.backend'

cd `dirname $0`
cd ../../../

source .env

mkdir -p src/${DC_SERRVICE_NAME}

# Djangoプロジェクトの作成は現在のユーザーで行う
# https://echo.labstack.com/docs/quick-start
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
go mod init app
go get github.com/labstack/echo/v4
"

cp ./script/init/create.services/copy.files/${DC_SERRVICE_NAME}/server.go ./src/${DC_SERRVICE_NAME}/server.go
