#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='echo.app.backend'

cd `dirname $0`
cd ../../../

# go.modを作成
bash ./script/dependence.services/${DC_SERRVICE_NAME}/common/goget.sh

# https://gqlgen.com/getting-started/
# スケルトンを作成
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
mkdir -p .build/gqlgen
cp -f go.mod .build/gqlgen
cp -f go.sum .build/gqlgen
cd .build/gqlgen
go run github.com/99designs/gqlgen init
"

# スケルトンをプロジェクトフォルダに手動でコピー

# go.modを作成
bash ./script/dependence.services/${DC_SERRVICE_NAME}/common/gotidy.sh