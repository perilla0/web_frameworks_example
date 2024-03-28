#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='react-ts.client.apollo.app.frontend'

cd `dirname $0`
cd ../../../../

source .env

mkdir -p ./services/${DC_SERRVICE_NAME}/src

docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
npm create vite@latest . -- --template react-ts
npm install @apollo/client graphql
"

# オリジナルをバックアップ
cp ./services/${DC_SERRVICE_NAME}/src/src/main.tsx ./services/${DC_SERRVICE_NAME}/src/src/main.origin.tsx
cp ./services/${DC_SERRVICE_NAME}/src/src/App.tsx ./services/${DC_SERRVICE_NAME}/src/src/App.origin.tsx
# 差し替え
cp ./services/${DC_SERRVICE_NAME}/docker/init/copy/main.tsx ./services/${DC_SERRVICE_NAME}/src/src/main.tsx
cp ./services/${DC_SERRVICE_NAME}/docker/init/copy/App.tsx ./services/${DC_SERRVICE_NAME}/src/src/App.tsx
