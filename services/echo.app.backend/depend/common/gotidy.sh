#!/bin/bash

cd `dirname $0`
source ../../.service_env

cd ../../../../

# https://echo.labstack.com/docs/quick-start
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
go mod tidy
"