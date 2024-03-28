#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='echo.app.backend'

cd `dirname $0`
cd ../../../../

# ビルドしたファイルを削除
rm -rf ./services/${DC_SERRVICE_NAME}/depend/gqlgen/.build

# go.modを作成
bash ./services/${DC_SERRVICE_NAME}/depend/common/goget.sh

# https://gqlgen.com/getting-started/
# スケルトンを作成
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
rm -rf .build/gqlgen
mkdir -p .build/gqlgen
cp -f go.mod .build/gqlgen
cp -f go.sum .build/gqlgen
cd .build/gqlgen
go run github.com/99designs/gqlgen init
"

# スケルトンをバックアップ
cp ./services/${DC_SERRVICE_NAME}/src/.build/gqlgen ./services/${DC_SERRVICE_NAME}/depend/gqlgen/.build

# スケルトンをプロジェクトフォルダに手動でコピー
# ソースファイルを修正した後に、gotidy.shを手動で実行する