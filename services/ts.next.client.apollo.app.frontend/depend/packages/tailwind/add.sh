#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='ts.next.client.apollo.app.frontend'

cd `dirname $0`
cd ../../../../


docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
"
