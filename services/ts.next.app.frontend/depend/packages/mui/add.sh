#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='ts.next.app.frontend'

cd `dirname $0`
cd ../../../../


docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
npm install @mui/material @emotion/react @emotion/styled
npm install @fontsource/roboto
npm install @mui/icons-material
npm install @mui/material-nextjs @emotion/cache
"
