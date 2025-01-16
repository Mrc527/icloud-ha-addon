#!/bin/bash
echo "Starting..."
# Check if config.json exists and parse it
if [ -f /config/config.json ]; then
    echo "found config.json"
    cat /config/config.json
    export PUID=$(jq -r '.options.PUID' /config/config.json)
    export PGID=$(jq -r '.options.PGID' /config/config.json)
    export TZ=$(jq -r '.options.TZ' /config/config.json)
    export ENV_CONFIG_FILE_PATH=$(jq -r '.options.ENV_CONFIG_FILE_PATH' /config/config.json)

# Otherwise, check if config.yaml exists and parse it
elif [ -f /config/config.yaml ]; then
    echo "found config.yaml"
    cat /config/config.yaml
    export PUID=$(yq e '.options.PUID' /config/config.yaml)
    export PGID=$(yq e '.options.PGID' /config/config.yaml)
    export TZ=$(yq e '.options.TZ' /config/config.yaml)
    export ENV_CONFIG_FILE_PATH=$(yq e '.options.ENV_CONFIG_FILE_PATH' /config/config.yaml)
else
    echo "No configuration file found. Please provide either config.json or config.yaml."
    exit 1
fi

# Print all environment variables
echo "Environment Variables:"
env

# Execute the main process
exec "/app/init.sh"
