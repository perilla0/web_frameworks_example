#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='react-ts.client.apollo.app.frontend'

cd `dirname $0`
cd ../../../

source .env

mkdir -p src/${DC_SERRVICE_NAME}

docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
npm create vite@latest . -- --template react-ts
npm install @apollo/client graphql
"

# オリジナルをバックアップ
cp ./src/${DC_SERRVICE_NAME}/src/main.tsx ./src/${DC_SERRVICE_NAME}/src/main.origin.tsx
cp ./src/${DC_SERRVICE_NAME}/src/App.tsx ./src/${DC_SERRVICE_NAME}/src/App.origin.tsx
# 差し替え
cp ./script/init/create.services/copy.files/${DC_SERRVICE_NAME}/main.tsx ./src/${DC_SERRVICE_NAME}/src/main.tsx
cp ./script/init/create.services/copy.files/${DC_SERRVICE_NAME}/App.tsx ./src/${DC_SERRVICE_NAME}/src/App.tsx
