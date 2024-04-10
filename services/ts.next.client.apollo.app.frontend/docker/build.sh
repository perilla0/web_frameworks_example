#!/bin/bash

cd `dirname $0`
source ../.service_env

cd ../../../

docker compose rm -s ${DC_SERRVICE_NAME}
docker compose build ${DC_SERRVICE_NAME} --no-cache
