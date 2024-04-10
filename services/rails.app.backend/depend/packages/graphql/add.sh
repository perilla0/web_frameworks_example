#!/bin/bash

cd `dirname $0`
source ../../../.service_env

cd ../../../../../

# bundle => root権限
docker compose exec rails.app.backend bash -c "
bundle add graphql
bundle install
"

# https://graphql-ruby.org/schema/generators.html
# ソースファイル生成 => ユーザー権限
docker compose exec -u $(id -u):$(id -g) rails.app.backend bash -c "
rails generate graphql:install --schema=AppSchema
"

# bundle => root権限
docker compose exec rails.app.backend bash -c "
bundle install
"
