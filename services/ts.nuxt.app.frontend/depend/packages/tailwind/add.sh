#!/bin/bash

cd `dirname $0`
source ../../../.service_env

cd ../../../../../

docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init
"
