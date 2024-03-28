#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='django.app.backend'

cd `dirname $0`
cd ../../../../

source .env

mkdir -p ./services/${DC_SERRVICE_NAME}/src

# https://docs.djangoproject.com/ja/5.0/topics/install/#installing-official-release
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
django-admin startproject config .
"
