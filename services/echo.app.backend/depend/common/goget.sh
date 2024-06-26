#!/bin/bash

cd `dirname $0`
source ../../.service_env

cd ../../../../

# https://echo.labstack.com/docs/quick-start
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
go mod init app
go get github.com/labstack/echo/v4
go get github.com/99designs/gqlgen
"