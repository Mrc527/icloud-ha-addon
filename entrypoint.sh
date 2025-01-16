#!/bin/bash

# Check if config.json exists and parse it
if [ -f /config/config.json ]; then
    export PUID=$(jq -r '.options.PUID' /config/config.json)
    export PGID=$(jq -r '.options.PGID' /config/config.json)
    export TZ=$(jq -r '.options.TZ' /config/config.json)
    export ENV_CONFIG_FILE_PATH=$(jq -r '.options.ENV_CONFIG_FILE_PATH' /config/config.json)

# Otherwise, check if config.yaml exists and parse it
elif [ -f /config/config.yaml ]; then
    export PUID=$(yq e '.options.PUID' /config/config.yaml)
    export PGID=$(yq e '.options.PGID' /config/config.yaml)
    export TZ=$(yq e '.options.TZ' /config/config.yaml)
    export ENV_CONFIG_FILE_PATH=$(yq e '.options.ENV_CONFIG_FILE_PATH' /config/config.yaml)
else
    echo "No configuration file found. Please provide either config.json or config.yaml."
    exit 1
fi

# Execute the main process
exec "$@"
