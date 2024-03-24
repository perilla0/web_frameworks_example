#!/bin/bash

cd `dirname $0`
cd ../../

source .env

docker compose down

docker rmi -f ${PROJECT_NAME}_nginx.web.backend
docker rmi -f ${PROJECT_NAME}_nginx.web.frontend

for filename in ./script/init/remove.services/*.sh
do
    echo '#------------------------------------------------------------------------------------'
    echo '# filename:' ${filename}
    echo '#------------------------------------------------------------------------------------'
    bash ${filename}
done

docker builder prune

sudo rm -rf src
