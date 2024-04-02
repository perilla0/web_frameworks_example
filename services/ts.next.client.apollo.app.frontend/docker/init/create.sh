#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='ts.next.client.apollo.app.frontend'

cd `dirname $0`
cd ../../../../

source .env

mkdir -p ./services/${DC_SERRVICE_NAME}/src

docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
npx create-next-app@latest . --no-src-dir --no-tailwind --app
npm install @apollo/client graphql
"

# オリジナルをバックアップ
cp ./services/${DC_SERRVICE_NAME}/src/app/page.tsx ./services/${DC_SERRVICE_NAME}/src/app/page.origin.tsx
# 差し替え
cp ./services/${DC_SERRVICE_NAME}/docker/init/copy/page.tsx ./services/${DC_SERRVICE_NAME}/src/app/page.tsx
