#!/bin/bash

# Docker Compose サービス名
DC_SERRVICE_NAME='laravel.app.backend'

cd `dirname $0`
cd ../../../

source .env

mkdir -p src/${DC_SERRVICE_NAME}

# 現在ログイン中のユーザーでLaravelプロジェクトを作成する
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
composer create-project \"laravel/laravel=10.*\" ./
chmod -R 0777 storage
chmod -R 0777 bootstrap/cache
composer require predis/predis
composer require laravel/horizon
php artisan horizon:install
"

# 環境ファイルを差し替える
cp ./script/init/create.services/copy.files/${DC_SERRVICE_NAME}/.env.local ./src/${DC_SERRVICE_NAME}/.env

# .envのAPP_KEYを変更する
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
php artisan key:generate
"

# スターターキットのインストール
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
composer require laravel/breeze --dev
php artisan breeze:install ${LARAVEL_BREEZE_FRONTEND_OPTION}
npm install
npm run build
"

# GraphQLプラグインのインストール
# https://lighthouse-php.com/5/getting-started/installation.html#install-via-composer
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
composer require nuwave/lighthouse
php artisan vendor:publish --tag=lighthouse-schema
composer require mll-lab/laravel-graphiql
php artisan lighthouse:ide-helper
php artisan vendor:publish --tag=lighthouse-config
"
