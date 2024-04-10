#!/bin/bash

cd `dirname $0`
source ../../.service_env

cd ../../../../

source .env

mkdir -p ./services/${DC_SERRVICE_NAME}/src

# https://docs.djangoproject.com/ja/5.0/topics/install/#installing-official-release
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
django-admin startproject config .
"
