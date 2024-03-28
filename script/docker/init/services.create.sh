#!/bin/bash
cd `dirname $0`
cd ../../../

DC_SERVICE_NAMES=(
    'laravel.app.backend'
    'rails.app.backend'
    'django.app.backend'
    'echo.app.backend'
    'react-ts.client.apollo.app.frontend'
    'ts.next.app.frontend'
    'ts.nuxt.app.frontend'
    'kit.svelte.app.frontend'
)

for dc_service_name in "${DC_SERVICE_NAMES[@]}" ; do
    echo '#------------------------------------------------------------------------------------'
    echo "# filename: ./services/${dc_service_name}/docker/init/create.sh"
    echo '#------------------------------------------------------------------------------------'
    bash ./services/${dc_service_name}/docker/init/create.sh
done
