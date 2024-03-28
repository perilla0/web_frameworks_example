#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='ts.nuxt.app.frontend'

cd `dirname $0`
cd ../../../../
bash ./script/docker/common/service.remove.sh ${DC_SERRVICE_NAME}