#!/bin/bash
echo "Starting..."
# Check if config.json exists and parse it
if [ -f /data/options.yaml ]; then
    echo "found options.yaml"
    cat /data/options.yaml
    export PUID=$(yq e '.options.PUID' /data/options.yaml)
    export PGID=$(yq e '.options.PGID' /data/options.yaml)
    export TZ=$(yq e '.options.TZ' /data/options.yaml)
    export ENV_CONFIG_FILE_PATH=$(yq e '.options.ENV_CONFIG_FILE_PATH' /data/options.yaml)
    export ENV_CONFIG_FILE_PATH_KEY=$(yq e '.options.ENV_CONFIG_FILE_PATH' /data/options.yaml)
# Otherwise, check if config.yaml exists and parse it
elif [ -f /data/options.json ]; then
        echo "found options.json"
        cat /data/options.json
        export PUID=$(jq -r '.options.PUID' /data/options.json)
        export PGID=$(jq -r '.options.PGID' /data/options.json)
        export TZ=$(jq -r '.options.TZ' /data/options.json)
        export ENV_CONFIG_FILE_PATH=$(jq -r '.options.ENV_CONFIG_FILE_PATH' /data/options.json)
        export ENV_CONFIG_FILE_PATH_KEY=$(jq -r '.options.ENV_CONFIG_FILE_PATH' /data/options.json)
else
    echo "No configuration file found. Please provide either config.json or config.yaml."
    exit 1
fi

# Print all environment variables
echo "Environment Variables:"
env

# Execute the main process
exec "/app/init.sh"
