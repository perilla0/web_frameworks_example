#!/bin/bash

# ファイル名からDockerComposeサービス名を取得
DC_SERRVICE_NAME=`basename $0`
DC_SERRVICE_NAME=${DC_SERRVICE_NAME/.sh/}

cd `dirname $0`
cd ../../

docker compose rm -s ${DC_SERRVICE_NAME}
docker compose build ${DC_SERRVICE_NAME} --no-cache
