#!/bin/bash
echo "Starting..."
# Check if config.json exists and parse it
if [ -f /data/config.yaml ]; then
    echo "found config.yaml"
    cat /data/config.yaml
    export PUID=$(yq e '.options.PUID' /data/config.yaml)
    export PGID=$(yq e '.options.PGID' /data/config.yaml)
    export TZ=$(yq e '.options.TZ' /data/config.yaml)
    export ENV_CONFIG_FILE_PATH=$(yq e '.options.ENV_CONFIG_FILE_PATH' /data/config.yaml)
# Otherwise, check if config.yaml exists and parse it
elif [ -f /data/config.json ]; then
        echo "found config.json"
        cat /data/config.json
        export PUID=$(jq -r '.options.PUID' /data/config.json)
        export PGID=$(jq -r '.options.PGID' /data/config.json)
        export TZ=$(jq -r '.options.TZ' /data/config.json)
        export ENV_CONFIG_FILE_PATH=$(jq -r '.options.ENV_CONFIG_FILE_PATH' /data/config.json)
else
    echo "No configuration file found. Please provide either config.json or config.yaml."
    tail -f /config/config.json
    exit 1
fi

# Print all environment variables
echo "Environment Variables:"
env

# Execute the main process
exec "/app/init.sh"
