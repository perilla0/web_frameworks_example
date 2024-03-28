#!/bin/bash

if [ ! "$#" -eq 1 ]; then
    echo "Docker Composeサービス名を1つ指定してください"
    exit 1
fi

# Docker Compose サービス名は2文字以上を想定
if [[ ! $1 =~ ^[0-9a-zA-Z_.\-]{2,}$ ]]; then
    echo "Docker Compose サービス名が不正です"
    exit 1
fi

if [[ $1 =~ ^\.{1,}$ ]]; then
    echo "Docker Compose サービス名が不正です（ドットのみ）"
    exit 1
fi

# Docker Compose サービス名
DC_SERRVICE_NAME=$1

cd `dirname $0`
cd ../../../

source .env

PROJECT_DIR=`pwd`
REMOVE_TARGET_DIR=${PROJECT_DIR}/services/${DC_SERRVICE_NAME}/src/

echo '#-----------------------------------------------------------------------------'
echo '# [サービス名]: ' \"${DC_SERRVICE_NAME}\" 'を削除します'
echo '# [src] ' ${REMOVE_TARGET_DIR}
echo '#-----------------------------------------------------------------------------'

docker compose down
docker compose rm ${PROJECT_NAME}_${DC_SERRVICE_NAME}
docker rmi -f ${PROJECT_NAME}_${DC_SERRVICE_NAME}

if [ -d ${REMOVE_TARGET_DIR} ]; then
    sudo rm -rf ${REMOVE_TARGET_DIR}
    echo 'srcディレクトリを削除しました'
else
    echo 'srcディレクトリが存在しません'
fi