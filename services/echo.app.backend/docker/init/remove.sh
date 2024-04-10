#!/bin/bash

cd `dirname $0`
source ../../.service_env

cd ../../../../
bash ./script/docker/common/service.remove.sh ${DC_SERRVICE_NAME}