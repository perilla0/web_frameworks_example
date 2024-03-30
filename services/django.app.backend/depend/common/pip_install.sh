#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='django.app.backend'

cd `dirname $0`
cd ../../../../

docker compose exec ${DC_SERRVICE_NAME} bash -c "
cd /depend_def/
pip install -r requirements.txt
"