#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='ts.next.app.frontend'

cd `dirname $0`
cd ../../../

source .env

mkdir -p src/${DC_SERRVICE_NAME}

# https://ja.react.dev/learn/typescript
# https://nextjs.org/docs/getting-started/installation
# https://nextjs.org/docs/pages/api-reference/create-next-app
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
npx create-next-app@latest . --src-dir --ts --eslint --tailwind --app --import-alias '@/*'
"
