# Use the same base image
FROM mandarons/icloud-drive

# (Optional) Label or maintainer info
LABEL maintainer="Marco Visin <marco@visin.ch>"

# Declare volumes so Docker knows these are external
VOLUME ["/etc/timezone", "/etc/localtime"]

# Install yq for YAML parsing
RUN apk add --no-cache yq jq

# Copy the entrypoint script into the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
