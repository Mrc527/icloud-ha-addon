#!/bin/bash
CONFIG_PATH=/data/options.json
export PUID="$(bashio::config 'PUID')"
export PGID="$(bashio::config 'PGID')"
export TZ="$(bashio::config 'TZ')"
export ENV_CONFIG_FILE_PATH="$(bashio::config 'ENV_CONFIG_FILE_PATH')"

# Read the config.yaml file and export the options as environment variables
#export PUID=$(yq e '.options.PUID' /config/config.yaml)
#export PGID=$(yq e '.options.PGID' /config/config.yaml)
#export TZ=$(yq e '.options.TZ' /config/config.yaml)
#export ENV_CONFIG_FILE_PATH=$(yq e '.options.ENV_CONFIG_FILE_PATH' /config/config.yaml)

# Execute the main process
exec "$@"
