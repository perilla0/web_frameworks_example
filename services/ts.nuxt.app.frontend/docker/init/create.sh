#!/bin/bash

cd `dirname $0`
source ../../.service_env

cd ../../../../

source .env

mkdir -p ./services/${DC_SERRVICE_NAME}/src

# https://nuxt.com/docs/getting-started/installation
# https://nuxt.com/docs/api/commands/init
# https://nuxt.com/docs/guide/concepts/typescript
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
npx nuxi@latest init .
npm install --save-dev vue-tsc@^1 typescript
"
