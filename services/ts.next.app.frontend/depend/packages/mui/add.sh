#!/bin/bash

cd `dirname $0`
source ../../../.service_env

cd ../../../../../

docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
npm install @mui/material @emotion/react @emotion/styled
npm install @fontsource/roboto
npm install @mui/icons-material
npm install @mui/material-nextjs @emotion/cache
"
