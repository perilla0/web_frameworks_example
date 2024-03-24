#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='kit.svelte.app.frontend'

cd `dirname $0`
cd ../../../

source .env

mkdir -p src/${DC_SERRVICE_NAME}

# https://kit.svelte.jp/docs/creating-a-project
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
npm create svelte@latest .
npm install
"
