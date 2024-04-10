#!/bin/bash

cd `dirname $0`
source ../../.service_env

cd ../../../../

docker compose exec ${DC_SERRVICE_NAME} bash -c "
cd /depend_def/
pip install -r requirements.txt
"